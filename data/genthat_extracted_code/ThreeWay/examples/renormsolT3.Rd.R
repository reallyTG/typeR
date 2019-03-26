library(ThreeWay)


### Name: renormsolT3
### Title: Renormalization of the Tucker3 (and Tucker2) solution
### Aliases: renormsolT3
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
# T3 solution
BusT3 <- T3funcrep(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
# sums of squares of A and core
sum(BusT3$A^2)
sum(BusT3$H^2)
# Renormalization with respect to the A-mode
BusT3rA <- renormsolT3(BusT3$A, BusT3$B, BusT3$C, BusT3$H,1)
# sums of squares of A and core after renormalization
sum(BusT3rA$A^2)
sum(BusT3rA$H^2)



