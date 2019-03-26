library(DAAG)


### Name: tinting
### Title: Car Window Tinting Experiment Data
### Aliases: tinting
### Keywords: datasets

### ** Examples

levels(tinting$agegp) <- capstring(levels(tinting$agegp))
xyplot(csoa ~ it | sex * agegp, data=tinting) # Simple use of xyplot()
pause()

xyplot(csoa ~ it|sex*agegp, data=tinting, panel=panel.superpose, groups=target)
pause()

xyplot(csoa ~ it|sex*agegp, data=tinting, panel=panel.superpose, col=1:2,
  groups=target, key=list(x=0.14, y=0.84, points=list(pch=rep(1,2),
  col=1:2), text=list(levels(tinting$target), col=1:2), border=TRUE))
pause()

xyplot(csoa ~ it|sex*agegp, data=tinting, panel=panel.superpose,
  groups=tint, type=c("p","smooth"), span=0.8, col=1:3,
  key=list(x=0.14, y=0.84, points=list(pch=rep(1,2), col=1:3),
  text=list(levels(tinting$tint), col=1:3), border=TRUE))



