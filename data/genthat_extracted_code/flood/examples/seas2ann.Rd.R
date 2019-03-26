library(flood)


### Name: seas2ann
### Title: Annual maxima from seasonal maxima
### Aliases: seas2ann

### ** Examples

set.seed(28379)
x1 <- matrix(round(rnorm(8, 20, 25)), ncol=2)
x1[2] <- NA
x2 <- matrix(round(rnorm(8, 20, 25)), ncol=2)
x2[c(2,5,6)] <- NA
x1
x2
seas2ann(x1,x2,TRUE)
seas2ann(x1,x2,FALSE)



