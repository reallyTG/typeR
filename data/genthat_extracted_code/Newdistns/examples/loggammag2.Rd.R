library(Newdistns)


### Name: loggammag2
### Title: Log Gamma G II Distribution
### Aliases: dloggammag2 ploggammag2 qloggammag2 rloggammag2 mloggammag2
### Keywords: Log gamma G II distribution

### ** Examples
x=runif(10,min=0,max=1)
dloggammag2(x,"exp",a=1,b=1)
ploggammag2(x,"exp",a=1,b=1)
qloggammag2(x,"exp",a=1,b=1)
rloggammag2(10,"exp",a=1,b=1)
mloggammag2("exp",rexp(100),starts=c(1,1,1),method="BFGS")


