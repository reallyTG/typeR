library(rgr)


### Name: orthonorm
### Title: Computation of an Orthonormal Basis Matrix
### Aliases: orthonorm
### Keywords: multivariate manip

### ** Examples

## Make test data available
data(sind.mat2open)

## Compute and display clr transformed data
prmatrix(clr(sind.mat2open))

## Compute and display ilr transformed data
sind.ilr <-ilr(sind.mat2open)
prmatrix(sind.ilr)

## Compute and display orthonormal basis matrix
## sind.mat2open is a 25 by 6 matrix (data set)
V <- orthonorm(6)
prmatrix(V)

## Back-transform ilr transformed data to clr form and display
temp <- sind.ilr %*% t(V)
dimnames(temp)[[2]] <- dimnames(sind.mat2open)[[2]]
prmatrix(temp)

## Clean-up
rm(sind.ilr)
rm(V)
rm(temp)



