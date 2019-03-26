library(Newdistns)


### Name: expg
### Title: Exponentiated G Distribution
### Aliases: dexpg pexpg qexpg rexpg mexpg
### Keywords: Exponentiated G distribution

### ** Examples
x=runif(10,min=0,max=1)
dexpg(x,"exp",a=1)
pexpg(x,"exp",a=1)
qexpg(x,"exp",a=1)
rexpg(10,"exp",a=1)
mexpg("exp",rexp(100),starts=c(1,1),method="BFGS")


