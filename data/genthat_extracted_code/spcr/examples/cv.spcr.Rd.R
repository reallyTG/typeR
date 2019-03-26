library(spcr)


### Name: cv.spcr
### Title: Cross-validation for spcr
### Aliases: cv.spcr
### Keywords: models regression

### ** Examples

#data
n <- 50
np <- 5
set.seed(1)
nu0 <- c(-1, 1)
x <- matrix( rnorm(np*n), n, np )
e <- rnorm(n)
y <- nu0[1]*x[ ,1] + nu0[2]*x[ ,2] + e

#fit
cv.spcr.fit <- cv.spcr(x=x, y=y, k=2)
cv.spcr.fit

#fit (adaptive SPCR)
cv.adaspcr.fit <- cv.spcr(x=x, y=y, k=2, adaptive=TRUE)
cv.adaspcr.fit



