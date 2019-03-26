library(lintools)


### Name: normalize
### Title: Bring a system of (in)equalities in a standard form
### Aliases: normalize

### ** Examples


A <- matrix(1:12,nrow=4)
b <- 1:4
ops <- c("<=","==","==","<")
normalize(A,b,ops)
normalize(A,b,ops,unit=0.1)




