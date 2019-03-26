library(sdPrior)


### Name: mdbeta
### Title: Marginal Density of beta
### Aliases: mdbeta

### ** Examples

set.seed(123)
#1-dimensional example
D = 1
ngridbeta = 1000
rangebeta = c(0.000001,1)
a0 = b0 = 0.5
a = 5
b = 50
r = 0.005
mdf <- mdbeta(D=1,rangebeta,ngridbeta,a=a,b=b,r=r,a0=a0,b0=b0) 

#2-dimensional example
D = 2
ngridbeta = 100
rangebeta = c(0.000001,8)
a0 = b0 = 0.5
a = 5
b = 50
r = 0.005
mdf <- mdbeta(D=2,rangebeta,ngridbeta,a=a,b=b,r=r,a0=a0,b0=b0,plot=TRUE,log=TRUE) 
mdf$logpl()




