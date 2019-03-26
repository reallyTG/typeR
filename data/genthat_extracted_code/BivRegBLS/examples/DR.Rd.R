library(BivRegBLS)


### Name: DR
### Title: Deming Regression
### Aliases: DR
### Keywords: Deming Regression confidence interval confidence region
###   ellipse confidence bands

### ** Examples

library(BivRegBLS)
data(SBP)
res.DR=DR(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
res.DR$Estimate.DR
data(Aromatics)
res.DR=DR(data=Aromatics,xcol=3,ycol=4,ratio.var=2)



