library(rdmulti)


### Name: rdmc
### Title: Analysis of RD designs with multiple cutoffs
### Aliases: rdmc

### ** Examples

# Toy dataset
X <- runif(1000,0,100)
C <- c(rep(33,500),rep(66,500))
Y <- (1 + X + (X>=C))*(C==33)+(.5 + .5*X + .8*(X>=C))*(C==66) + rnorm(1000)
# rdmc with standard syntax
tmp <- rdmc(Y,X,C)
# rdmc with cutoff-specific bandwidths
tmp <- rdmc(Y,X,C,hvec=c(9,13))





