library(multiway)


### Name: meansq
### Title: Mean Square of Given Object
### Aliases: meansq

### ** Examples

##########   EXAMPLE 1   ##########
X <- 10
meansq(X)


##########   EXAMPLE 2   ##########
X <- 1:10
meansq(X)


##########   EXAMPLE 3   ##########
X <- matrix(1:10,5,2)
meansq(X)


##########   EXAMPLE 4   ##########
X <- array(matrix(1:10,5,2),dim=c(5,2,2))
meansq(X)


##########   EXAMPLE 5   ##########
X <- vector("list",5)
for(k in 1:5){ X[[k]] <- matrix(1:10,5,2) }
meansq(X)




