library(Newdistns)


### Name: weibullg
### Title: Weibull G Distribution
### Aliases: dweibullg pweibullg qweibullg rweibullg mweibullg
### Keywords: Weibull G distribution

### ** Examples
x=runif(10,min=0,max=1)
dweibullg(x,"exp",beta=1,c=1)
pweibullg(x,"exp",beta=1,c=1)
qweibullg(x,"exp",beta=1,c=1)
rweibullg(10,"exp",beta=1,c=1)
mweibullg("exp",rexp(100),starts=c(1,1,1),method="BFGS")


