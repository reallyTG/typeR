library(synlik)


### Name: orderDist
### Title: Summarize marginal distribution of (differenced) series.
### Aliases: orderDist

### ** Examples

library(synlik)
set.seed(10)
n <- 100;nr <- 3
x <- matrix(runif(n*nr),n,nr)
z <- runif(n)
beta <- orderDist(x,z,np=3,diff=1)

zd <- z;xd <- x[,3]
zd <- diff(zd,1);xd <- diff(xd,1)
zd <- sort(zd);zd <- zd - mean(zd)
xd <- sort(xd);xd <- xd - mean(xd)
lm(xd~zd+I(zd^2)+I(zd^3)-1)



