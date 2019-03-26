library(copula)


### Name: multIndepTest
### Title: Independence Test Among Continuous Random Vectors Based on the
###   Empirical Copula Process
### Aliases: multIndepTest
### Keywords: htest

### ** Examples

## Consider the following example taken from
## Kojadinovic and Holmes (2008):

n <- 100

## Generate data
y <- matrix(rnorm(6*n),n,6)
y[,1] <- y[,2]/2 + sqrt(3)/2*y[,1]
y[,3] <- y[,4]/2 + sqrt(3)/2*y[,3]
y[,5] <- y[,6]/2 + sqrt(3)/2*y[,5]

nc <- normalCopula(0.3,dim=3)
x <- cbind(y,rCopula(n, nc),rCopula(n, nc))

x[,1] <- abs(x[,1]) * sign(x[,3] * x[,5])
x[,2] <- abs(x[,2]) * sign(x[,3] * x[,5])
x[,7] <- x[,7] + x[,10]
x[,8] <- x[,8] + x[,11]
x[,9] <- x[,9] + x[,12]

## Dimensions of the random vectors
d <- c(2,2,2,3,3)

## Run the test
test <- multIndepTest(x,d)
test

## Display the dependogram
dependogram(test,print=TRUE)



