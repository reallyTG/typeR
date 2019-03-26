library(Newdistns)


### Name: mbetag
### Title: Modified Beta G Distribution
### Aliases: dmbetag pmbetag qmbetag rmbetag mmbetag
### Keywords: Modified beta G distribution

### ** Examples
x=runif(10,min=0,max=1)
dmbetag(x,"exp",beta=1,a=1,b=1)
pmbetag(x,"exp",beta=1,a=1,b=1)
qmbetag(x,"exp",beta=1,a=1,b=1)
rmbetag(10,"exp",beta=1,a=1,b=1)
mmbetag("exp",rexp(100),starts=c(1,1,1,1),method="BFGS")


