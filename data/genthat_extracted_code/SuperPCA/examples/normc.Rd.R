library(SuperPCA)


### Name: normc
### Title: Normaliz the columns of x to a length of 1.
### Aliases: normc

### ** Examples

#ex1.
m <- matrix(1:4,2,2,byrow=TRUE)
normc(m)
#ex2.
n <- matrix(rnorm(100,10,1),10,10)
normc(n)



