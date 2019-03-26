library(affy)


### Name: mva.pairs
### Title: M vs. A Matrix
### Aliases: mva.pairs
### Keywords: hplot

### ** Examples

    x <- matrix(rnorm(4000),1000,4)
    x[,1] <- x[,1]^2
    dimnames(x) <- list(NULL,c("chip 1","chip 2","chip 3","chip 4"))
    mva.pairs(x,log=FALSE,main="example")



