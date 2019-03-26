library(ThreeWay)


### Name: T2func
### Title: Algorithm for the Tucker2 model
### Aliases: T2func
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
# T2-AB solution using two components for the A- and B-modes 
# (rational starting point by SVD [start=0])
BusT2 <- T2func(Bus, 7, 5, 37, 2, 2, 37, 0, 1e-6, 1)
# T2-AC solution using two components for for the A- and C-modes 
# (random orthonormalized starting point [start=1])
BusT2 <- T2func(Bus, 7, 5, 37, 2, 5, 2, 1, 1e-6, 2)
# T2-BC solution using two components for the B- and C- modes 
# (user starting point [start=2])
BusT2 <- T2func(Bus, 7, 5, 37, 7, 2, 2, 1, 1e-6, 3, diag(7), 
 matrix(rnorm(5*2),nrow=5), matrix(rnorm(37*2),nrow=37), 
 matrix(rnorm(7*4),nrow=7))



