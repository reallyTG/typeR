library(biganalytics)


### Name: biganalytics-package
### Title: Utilities for big.matrix objects of package bigmemory
### Aliases: biganalytics biganalytics-package
### Keywords: package

### ** Examples

library(bigmemory)

x <- big.matrix(5, 2, type="integer", init=0,
                dimnames=list(NULL, c("alpha", "beta")))
x
x[,]
x[,1] <- 1:5
x[,]
mean(x)
colmean(x)
summary(x)
apply(x, 1, mean)



