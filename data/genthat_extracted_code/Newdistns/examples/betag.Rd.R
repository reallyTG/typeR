library(Newdistns)


### Name: betag
### Title: Beta G Distribution
### Aliases: dbetag pbetag qbetag rbetag mbetag
### Keywords: Beta G distribution

### ** Examples
x=runif(10,min=0,max=1)
dbetag(x,"exp",a=1,b=1)
pbetag(x,"exp",a=1,b=1)
qbetag(x,"exp",a=1,b=1)
rbetag(10,"exp",a=1,b=1)
mbetag("exp",rexp(100),starts=c(1,1,1),method="BFGS")


