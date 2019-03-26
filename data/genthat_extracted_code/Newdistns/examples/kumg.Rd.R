library(Newdistns)


### Name: kumg
### Title: Kumaraswamy G Distribution
### Aliases: dkumg pkumg qkumg rkumg mkumg
### Keywords: Kumaraswamy G distribution

### ** Examples
x=runif(10,min=0,max=1)
dkumg(x,"exp",a=1,b=1)
pkumg(x,"exp",a=1,b=1)
qkumg(x,"exp",a=1,b=1)
rkumg(10,"exp",a=1,b=1)
mkumg("exp",rexp(100),starts=c(1,1,1),method="BFGS")


