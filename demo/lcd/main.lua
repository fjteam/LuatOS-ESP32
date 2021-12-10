--- 模块功能：lcddemo
-- @module lcd
-- @author Dozingfiretruck
-- @release 2021.01.25

-- LuaTools需要PROJECT和VERSION这两个信息
PROJECT = "lcddemo"
VERSION = "1.0.0"

log.info("main", PROJECT, VERSION)

-- sys库是标配
_G.sys = require("sys")

--添加硬狗防止程序卡死
-- wdt.init(15000)--初始化watchdog设置为15s
-- sys.timerLoopStart(wdt.feed, 10000)--10s喂一次狗

spi_lcd = spi.deviceSetup(2,5,0,0,8,40000000,spi.MSB,1,1)
log.info("lcd.init",
lcd.init("st7789",{port = "device",pin_dc = 3, pin_rst = 4,direction = 0,w = 240,h = 320,xoffset = 0,yoffset = 0},spi_lcd))

log.info("lcd.drawLine", lcd.drawLine(20,20,150,20,0x001F))
log.info("lcd.drawRectangle", lcd.drawRectangle(20,40,120,70,0xF800))
log.info("lcd.drawCircle", lcd.drawCircle(50,50,20,0x0CE0))

sys.taskInit(function()
    while 1 do
        sys.wait(500)
    end
end)


-- 用户代码已结束---------------------------------------------
-- 结尾总是这一句
sys.run()
-- sys.run()之后后面不要加任何语句!!!!!
