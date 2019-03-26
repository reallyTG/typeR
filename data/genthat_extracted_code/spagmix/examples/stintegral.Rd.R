library(spagmix)


### Name: stintegral
### Title: Evaluate integral of a spatiotemporal object
### Aliases: stintegral

### ** Examples

## No test: 

# 'stim' objects
require("abind")
m1 <- c(0.3,0.3,2)
m2 <- c(0.5,0.8,8)
m3 <- c(0.7,0.6,7)
v1 <- diag(c(0.01^2,0.01^2,1))
v2 <- diag(c(0.005,0.005,0.5))
v3 <- diag(c(0.005,0.005,0.5))
stg1 <- stgmix(mean=cbind(m1,m2,m3),vcv=abind(v1,v2,v3,along=3),
               window=toywin,tlim=c(0,10),p0=0.1,tres=64)
stg2 <- stgmix(mean=cbind(m1,m2,m3),vcv=abind(v1,v2,v3,along=3),
               window=toywin,tlim=c(0,10),p0=0.1,tres=64,int=200)
stintegral(stg1)
stintegral(stg2)

# 'sten' objects
require("sparr")
data(burk)
hlam <- OS.spattemp(burk$cases)
bden <- spattemp.density(burk$cases,h=hlam[1],lambda=hlam[2],sres=64,verbose=FALSE)
stintegral(bden)
## End(No test)



