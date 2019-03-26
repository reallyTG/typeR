library(RandomFields)


### Name: RMcov
### Title: Non-stationary covariance model corresponding to a variogram
###   model
### Aliases: RMcov RMcov RMCOV_X
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
bm <- RMfbm(alpha=1)
plot(bm)

x <- seq(0, 6, if (interactive()) 0.125 else 3)
plot(RFsimulate(bm, x))

## standardizing with the random variable at the origin
z1 <- RFsimulate(RMcov(bm), x)
plot(z1)
z1 <- as.vector(z1)
zero <- which(abs(x) == 0)
stopifnot(abs(z1[zero]) < 1e-13)

## standardizing with the random variable at the center of the interval
z2 <- RFsimulate(RMcov(bm, "center"), x)
plot(z2)
z2 <- as.vector(z2)
stopifnot(abs(z2[(length(z2) + 1) / 2]) < 1e-13)


## standardizing with the random variables at the end points of the interval
z3 <- RFsimulate(RMcov(bm, "extremals"), x)
plot(z3)
z3 <- as.vector(z3)
stopifnot(abs(z3[1] + z3[length(z3)]) < 1e-13)

## Don't show: 
FinalizeExample()
## End(Don't show)



