library(cacIRT)


### Name: recursive.raw
### Title: Recursive computation of conditional total score
### Aliases: recursive.raw gen.rec.raw
### Keywords: ~IRT

### ** Examples

theta <- c(-1,0, 1)
params<-matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)

#using IRT model and item parameters
rec.mat <- recursive.raw(params, theta)

#using user supplied probability array
Pij.flat <- irf(params, theta)$f

#through matrix input
rec.mat2 <- gen.rec.raw(Pij.flat, theta)

#through array input (this can be generalized to polytomous tests)
Pij.array <- array(NA, dim = c(length(theta), 2, nrow(params)))

Pij.array[,1,] <- 1 - Pij.flat #P(X_j = 0 | theta_i)
Pij.array[,2,] <- Pij.flat     #P(X_j = 1 | theta_i)

rec.mat3 <- gen.rec.raw(Pij.array, theta)

#same results
max(c(rec.mat-rec.mat3, rec.mat2-rec.mat3))



