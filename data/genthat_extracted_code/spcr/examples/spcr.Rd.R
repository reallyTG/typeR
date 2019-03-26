library(spcr)


### Name: spcr
### Title: Fit a sparse principal component regression (SPCR)
### Aliases: spcr
### Keywords: models regression

### ** Examples

#data
n <- 100
np <- 5
set.seed(4)
nu0 <- c(-1, 1)
x <- matrix( rnorm(np*n), n, np )
e <- rnorm(n)
y <- nu0[1]*x[ ,1] + nu0[2]*x[ ,2] + e

#fit
spcr.fit <- spcr(x=x, y=y, k=2, lambda.B=6, lambda.gamma=2)
spcr.fit

#fit (adaptive SPCR)
adaspcr.fit <- spcr(x=x, y=y, k=2, lambda.B=6, lambda.gamma=2, adaptive=TRUE)
adaspcr.fit



