library(rdmulti)


### Name: rdms
### Title: Analysis of RD designs with cumulative cutoffs or two running
###   variables
### Aliases: rdms

### ** Examples

# Toy dataset: cumulative cutoffs
X <- runif(1000,0,100)
C <- c(33,66)
Y <- (1+X)*(X<C[1])+(0.8+0.8*X)*(X>=C[1]&X<C[2])+(1.2+1.2*X)*(X>=C[2]) + rnorm(1000)
# rmds: basic syntax
tmp <- rdms(Y,X,C)





