library(FactoClass)


### Name: list.to.data
### Title: list to data.frame
### Aliases: list.to.data
### Keywords: multivariate

### ** Examples


 A <- data.frame(r1=rnorm(5),r2=rnorm(5))
 B <- data.frame(r1=rnorm(15),r2=rnorm(15))

 LL <- list(A=A,B=B)
 LL
 list.to.data(LL)





