library(MCPAN)


### Name: SCSrank
### Title: Compute a rectangular simultaneous confidence set from a sample
###   of a joint empirical distribution.
### Aliases: SCSrank
### Keywords: htest

### ** Examples


x <- cbind(rnorm(1000,1,2), rnorm(1000,0,2), rnorm(1000,0,0.5), rnorm(1000,2,1))
dim(x)
cm <- rbind(c(-1,1,0,0), c(-1,0,1,0), c(-1, 0,0,1))
xd <- t(apply(x, 1, function(x){crossprod(t(cm), matrix(x))}))
pairs(xd)

SCSrank(xd, conf.level=0.9)




