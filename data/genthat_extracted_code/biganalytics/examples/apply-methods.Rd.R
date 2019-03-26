library(biganalytics)


### Name: apply,big.matrix-method
### Title: apply() for big.matrix objects
### Aliases: apply,big.matrix-method

### ** Examples

library(bigmemory)
options(bigmemory.typecast.warning=FALSE)
x <- big.matrix(5, 2, type="integer", init=0,
                dimnames=list(NULL, c("alpha", "beta")))
x[,] <- round(rnorm(10))
biganalytics::apply(x, 1, mean)



