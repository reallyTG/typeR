library(LogConcDEAD)


### Name: getweights
### Title: Find appropriate weights for likelihood calculations
### Aliases: getweights
### Keywords: multivariate nonparametric

### ** Examples

## simple normal example

x <- matrix(rnorm(200),ncol=2)
tmp <- getweights(x)
lcd <- mlelcd(tmp$x,tmp$w)
plot(lcd,type="ic")



