library(BivRegBLS)


### Name: BLS
### Title: Bivariate Least Square regression (BLS)
### Aliases: BLS
### Keywords: BLS Bivariate Least Square regression confidence interval
###   confidence region ellipse confidence bands predictive interval

### ** Examples

library(BivRegBLS)
data(SBP)
# BLS regression on replicated data
res.BLS1=BLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,qx=3,qy=3,xpred=c(100,120,140,160))
# BLS regression on unreplicated data with measurement error variances previously estimated
res.BLS2=BLS(data=SBP,xcol=c("J1"),ycol="S1",var.x=80,var.y=50,df.var.x=100,df.var.y=100)



