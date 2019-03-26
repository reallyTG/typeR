library(Newdistns)


### Name: expkumg
### Title: Exponentiated Kumaraswamy G Distribution
### Aliases: dexpkumg pexpkumg qexpkumg rexpkumg mexpkumg
### Keywords: Exponentiated Kumaraswamy G distribution

### ** Examples
x=runif(10,min=0,max=1)
dexpkumg(x,"exp",a=1,b=1,c=1)
pexpkumg(x,"exp",a=1,b=1,c=1)
qexpkumg(x,"exp",a=1,b=1,c=1)
rexpkumg(10,"exp",a=1,b=1,c=1)
mexpkumg("exp",rexp(100),starts=c(1,1,1,1),method="BFGS")


