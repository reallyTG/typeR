library(sirt)


### Name: gom.jml
### Title: Grade of Membership Model (Joint Maximum Likelihood Estimation)
### Aliases: gom.jml
### Keywords: Grade of membership model

### ** Examples

#############################################################################
# EXAMPLE 1: TIMSS data
#############################################################################

data( data.timss)
dat <- data.timss$data[, grep("M", colnames(data.timss$data) ) ]

# 2 Classes (deterministic starting values)
m2 <- sirt::gom.jml(dat,K=2, maxiter=10 )
summary(m2)

## Not run: 
##D # 3 Classes with fixed seed and maximum number of iterations
##D m3 <- sirt::gom.jml(dat,K=3, maxiter=50,seed=89)
##D summary(m3)
## End(Not run)



