library(mousetrack)


### Name: getmouseDV
### Title: Get Mouse Dependent Variables
### Aliases: getmouseDV
### Keywords: ts

### ** Examples


data(mousemove)
unit = 25; dwellfin = escape = escapeinit = 100
velajbin = 6

x = mousemove$x; y = mousemove$y;
counterb = as.character( mousemove$counterb[1] )
refcounterb = "R"
t = mousemove$time

ans =  getmouseDV(x, y, t, unit, counterb,
        refcounterb, dwellfin, velajbin,
        escape, escapeinit)

str(ans)





