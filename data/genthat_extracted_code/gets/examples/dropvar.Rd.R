library(gets)


### Name: dropvar
### Title: Drop variable
### Aliases: dropvar
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

set.seed(1)
x <- matrix(rnorm(20), 5)
dropvar(x) #full rank, none are dropped

x[,4] <- x[,1]*2
dropvar(x) #less than full rank, last column dropped



