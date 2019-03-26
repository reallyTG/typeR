library(Newdistns)


### Name: loggammag1
### Title: Log Gamma G I Distribution
### Aliases: dloggammag1 ploggammag1 qloggammag1 rloggammag1 mloggammag1
### Keywords: Log gamma G I distribution

### ** Examples
x=runif(10,min=0,max=1)
dloggammag1(x,"exp",a=1,b=1)
ploggammag1(x,"exp",a=1,b=1)
qloggammag1(x,"exp",a=1,b=1)
rloggammag1(10,"exp",a=1,b=1)
mloggammag1("exp",rexp(100),starts=c(1,1,1),method="BFGS")


