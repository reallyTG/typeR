library(ks)


### Name: Hlscv
### Title: Least-squares cross-validation (LSCV) bandwidth matrix selector
###   for multivariate data
### Aliases: Hlscv Hlscv.diag Hucv Hucv.diag hlscv hucv
### Keywords: smooth

### ** Examples

library(MASS)
data(forbes)
Hlscv(forbes)
hlscv(forbes$bp)



