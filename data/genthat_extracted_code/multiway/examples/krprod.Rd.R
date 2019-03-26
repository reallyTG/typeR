library(multiway)


### Name: krprod
### Title: Khatri-Rao Product
### Aliases: krprod
### Keywords: array algebra

### ** Examples

##########   EXAMPLE 1   ##########
X <- matrix(1,4,2)
Y <- matrix(1:4,2,2)
krprod(X,Y)


##########   EXAMPLE 2   ##########
X <- matrix(1:2,4,2)
Y <- matrix(1:4,2,2)
krprod(X,Y)


##########   EXAMPLE 3   ##########
X <- matrix(1:2,4,2,byrow=TRUE)
Y <- matrix(1:4,2,2)
krprod(X,Y)




