library(aSPU)


### Name: aSPUr
### Title: Robust Sum of powered score (SPU) tests and aSPU test for a
###   quantitative trait
### Aliases: aSPUr

### ** Examples



data(exdat)

## example analysis using aSPU test on exdat data.

QT <- jitter(exdat$Y)

out <- aSPUr(Y = QT, X = exdat$X, cov = NULL, B = 100)
out
## This is a vector of p-values for SPUr and aSPUr tests.
## SPU1 to SPUInf corresponds with the option pow=c(1:8, Inf)
## They are p-values for corresponding SPUr tests.
## The last element is p-value of aSPUr test.




