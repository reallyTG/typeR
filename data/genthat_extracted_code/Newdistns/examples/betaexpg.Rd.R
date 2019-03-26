library(Newdistns)


### Name: betaexpg
### Title: Beta Exponential G Distribution
### Aliases: dbetaexpg pbetaexpg qbetaexpg rbetaexpg mbetaexpg
### Keywords: Beta exponential G distribution

### ** Examples
x=runif(10,min=0,max=1)
dbetaexpg(x,"exp",lambda=1,a=1,b=1)
pbetaexpg(x,"exp",lambda=1,a=1,b=1)
qbetaexpg(x,"exp",lambda=1,a=1,b=1)
rbetaexpg(10,"exp",lambda=1,a=1,b=1)
mbetaexpg("exp",rexp(100),starts=c(1,1,1,1),method="BFGS")


