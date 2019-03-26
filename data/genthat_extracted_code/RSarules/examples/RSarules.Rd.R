library(RSarules)


### Name: RSarules
### Title: Random Sampling Association Rules from a Transaction Dataset
### Aliases: RSarules
### Keywords: RSarules

### ** Examples

### simulation study: example 1 

## generate data using R package 'MultiOrd'

set.seed(200)
library(MultiOrd)
library(arules)
l <- 5
n <- 100
mp <- rep(0.5, l-1)
bcor <- diag( x=1, nrow = l-1, ncol = l-1 )
bcor[1, l-1] <- 0.8
bcor[l-1, 1] <- 0.8
bcor[2, l-1] <- 0
bcor[l-1, 2] <- 0
bcor[3, l-1] <- 0.2
bcor[l-1, 3] <- 0.2
validation.CorrMat( mp, bcor)
dd <- generate.binary( n, mp, bcor)
data <- cbind(dd, 1- dd[, l-1])
colnames(data) <- c( paste( "I", 1:(l-2), sep = ""), "r1", "r2")

## Response being the last second item

rhs <- dim(data)[2]-1 # the last second item to be in the rhs
lhs_offset <- c( dim(data)[2])  # column numbers that are not contained in the lhs
M <- 10 # number of arules need to be sampled. M = 1000 in the reference paper.
ig <- 10 # the value for the tuning parameter 3, 6, 10
result <- RSarules( data = data, rhs = rhs, M = M , ig = ig, lhs_offset = lhs_offset )
result
inspect(result$sampled_rules)

## Response being the last second item

rhs2 <- dim(data)[2] # the last second item to be in the rhs
lhs_offset2 <- c( dim(data)[2]-1)  # column numbers that are not contained in the lhs
M <- 10 # number of arules need to be sampled. M = 1000 in the reference paper.
ig <- 10 # the value for the tuning parameter 3, 6, 10
result2 <- RSarules( data = data, rhs = rhs2, M = M , ig = ig, lhs_offset = lhs_offset2 )
result2
inspect(result2$sampled_rules) 



