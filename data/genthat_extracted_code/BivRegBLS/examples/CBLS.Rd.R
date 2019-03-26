library(BivRegBLS)


### Name: CBLS
### Title: Correlated Bivariate Least Square regression (CBLS)
### Aliases: CBLS
### Keywords: CBLS Correlated Bivariate Least Square regression confidence
###   interval confidence region ellipse confidence bands predictive
###   interval

### ** Examples

library(BivRegBLS)
data(SBP)
# CBLS regression on replicated data
res.CBLS1=CBLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,qx=3,qy=3,xpred=c(100,120,140,160))
# CBLS regression on unreplicated data with measurement error variances previously estimated
res.CBLS2=CBLS(data=SBP,xcol=c("J1"),ycol="S1",var.x=80,var.y=50,df.var.x=100,df.var.y=100)



