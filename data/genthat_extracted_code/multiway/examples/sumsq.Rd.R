library(multiway)


### Name: sumsq
### Title: Sum-of-Squares of Given Object
### Aliases: sumsq

### ** Examples

##########   EXAMPLE 1   ##########
X <- 10
sumsq(X)


##########   EXAMPLE 2   ##########
X <- 1:10
sumsq(X)


##########   EXAMPLE 3   ##########
X <- matrix(1:10,5,2)
sumsq(X)


##########   EXAMPLE 4   ##########
X <- array(matrix(1:10,5,2),dim=c(5,2,2))
sumsq(X)


##########   EXAMPLE 5   ##########
X <- vector("list",5)
for(k in 1:5){ X[[k]] <- matrix(1:10,5,2) }
sumsq(X)




