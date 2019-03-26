library(Newdistns)


### Name: gbg
### Title: Generalized Beta G Distribution
### Aliases: dgbg pgbg qgbg rgbg mgbg
### Keywords: Generalized beta G distribution

### ** Examples
x=runif(10,min=0,max=1)
dgbg(x,"exp",a=1,b=1,c=1)
pgbg(x,"exp",a=1,b=1,c=1)
qgbg(x,"exp",a=1,b=1,c=1)
rgbg(10,"exp",a=1,b=1,c=1)
mgbg("exp",rexp(100),starts=c(1,1,1,1),method="BFGS")


