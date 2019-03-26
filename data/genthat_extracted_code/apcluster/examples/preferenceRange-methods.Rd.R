library(apcluster)


### Name: preferenceRange
### Title: Determine Meaningful Ranges for Input Preferences
### Aliases: preferenceRange preferenceRange-methods
###   preferenceRange,matrix-method preferenceRange,Matrix-method
###   preferenceRange,dgTMatrix-method preferenceRange,sparseMatrix-method
### Keywords: cluster

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(100, 0.2, 0.05), rnorm(100, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## create similarity matrix
sim <- negDistMat(x, r=2)

## determine bounds
preferenceRange(sim)

## determine exact range
preferenceRange(sim, exact=TRUE)



