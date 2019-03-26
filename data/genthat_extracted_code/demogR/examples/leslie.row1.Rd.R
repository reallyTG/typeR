library(demogR)


### Name: leslie.row1
### Title: leslie.row1
### Aliases: leslie.row1
### Keywords: array algebra

### ** Examples

## simulate survival values from a beta(9,1) distribution

px <- rbeta(10,9,1)

## simulate fertility values from a gamma(2,10) distribution with age
##   at first reproduction = 10

mx <- c(0,0,0,rgamma(8,2,10))
A <- odiag(px,-1)
Fx <- leslie.row1(mx,px)
A[1,] <- Fx





