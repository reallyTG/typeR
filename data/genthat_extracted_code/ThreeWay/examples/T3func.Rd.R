library(ThreeWay)


### Name: T3func
### Title: Algorithm for the Tucker3 model
### Aliases: T3func
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
# T3 solution using two components for all the modes 
# (rational starting point by SVD [start=0])
BusT3 <- T3func(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
# T3 solution using two components for all the modes 
# (random orthonormalized starting point [start=1])
BusT3 <- T3func(Bus, 7, 5, 37, 2, 2, 2, 1, 1e-6)
# T3 solution using two components for all the modes 
# (user starting point [start=2])
BusT3 <- T3func(Bus, 7, 5, 37, 2, 2, 2, 1, 1e-6, matrix(rnorm(7*2),nrow=7), 
 matrix(rnorm(5*2),nrow=5), matrix(rnorm(37*2),nrow=37), 
 matrix(rnorm(2*4),nrow=2))



