library(mousetrack)


### Name: mousetrack-package
### Title: Mouse-tracking measures from trajectory data.
### Aliases: mousetrack-package
### Keywords: package ts, utilities

### ** Examples


data(mousemove) ## load data 

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





