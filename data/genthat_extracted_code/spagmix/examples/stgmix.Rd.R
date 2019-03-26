library(spagmix)


### Name: stgmix
### Title: Trivariate Gaussian mixture density generation
### Aliases: stgmix stim

### ** Examples

## No test: 
require("abind")
m1 <- c(0.3,0.3,2)
m2 <- c(0.5,0.8,8)
m3 <- c(0.7,0.6,7)
v1 <- diag(c(0.01^2,0.01^2,1))
v2 <- diag(c(0.005,0.005,0.5))
v3 <- diag(c(0.005,0.005,0.5))
stg1 <- stgmix(mean=cbind(m1,m2,m3),
               vcv=abind(v1,v2,v3,along=3),
               window=toywin,tlim=c(1,10),
               p0=0.1,tres=64)
plot(stg1,log=TRUE)


mn <- matrix(c(0,0,0,-2,1,4,1,-2,8),nrow=3)
vr <- array(c(1,0,0,0,1,0,0,0,1,1,0,0.5,0,1,0,0.5,0,3,1,0,0,0,2,0,0,0,1),
            dim=c(3,3,3))
stg2 <- stgmix(mean=mn,vcv=vr,window=shp1,
               tlim=c(0,10),tres=50)
plot(stg2,fix.range=TRUE,sleep=0.1)
## End(No test)



