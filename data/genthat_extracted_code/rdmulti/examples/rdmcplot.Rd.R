library(rdmulti)


### Name: rdmcplot
### Title: RD plots with multiple cutoffs.
### Aliases: rdmcplot

### ** Examples

# Toy dataset
X <- runif(1000,0,100)
C <- c(rep(33,500),rep(66,500))
Y <- (1 + X + (X>=C))*(C==33)+(.5 + .5*X + .8*(X>=C))*(C==66) + rnorm(1000)
# rdmcplot with standard syntax
tmp <- rdmcplot(Y,X,C)





