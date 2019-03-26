library(BivRegBLS)


### Name: MD.horiz.lines
### Title: Tolerance intervals in a (M,D) plot
### Aliases: MD.horiz.lines
### Keywords: tolerance interval MD plot Bland-Altman agreement

### ** Examples

library(BivRegBLS)
data(SBP)
res.MD.horiz=MD.horiz.lines(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,pred.level=0.95)
res.MD.horiz$Intervals.horiz.lines



