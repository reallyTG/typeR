library(robCompositions)


### Name: pivotCoord
### Title: Pivot coordinates and their inverse
### Aliases: pivotCoord isomLR isomLRinv isomLRp isomLRinvp isomLR
###   isomLRinv pivotCoordInv isomLRp isomLRinvp
### Keywords: math

### ** Examples


require(MASS)
Sigma <- matrix(c(5.05,4.95,4.95,5.05), ncol=2, byrow=TRUE)
z <- pivotCoordInv(mvrnorm(100, mu=c(0,2), Sigma=Sigma))

data(expenditures)
## first variable as pivot variable
pivotCoord(expenditures)
## third variable as pivot variable
pivotCoord(expenditures, 3) 

x <- exp(mvrnorm(2000, mu=rep(1,10), diag(10)))
system.time(pivotCoord(x))
system.time(pivotCoord(x, fast=TRUE))

## without normalizing constant
pivotCoord(expenditures, norm = "orthogonal") # or:
pivotCoord(expenditures, norm = "1")
## other normalization
pivotCoord(expenditures, norm = "-sqrt((D-i)/(D-i+1))")

# symmetric balances (results in 2-dim symmetric balances)
pivotCoord(expenditures, method = "symm")



