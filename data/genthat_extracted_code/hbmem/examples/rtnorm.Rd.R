library(hbmem)


### Name: rtnorm
### Title: Function rtnorm
### Aliases: rtnorm

### ** Examples

library(hbmem)
#Draw one
rtnorm(1,0,1,0,.2)

#Draw 50
N=500
mu=rep(0,N)
sigma=rep(1,N)
a=rep(1,N)
b=rep(2,N)
x=rtnorm(N,mu,sigma,a,b)
hist(x)

#Break it
rtnorm(1,0,1,1000,1001)



