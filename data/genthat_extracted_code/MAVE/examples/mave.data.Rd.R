library(MAVE)


### Name: mave.data
### Title: The reduced data matrix
### Aliases: mave.data

### ** Examples


x <- matrix(rnorm(400),100,4)
y <- x[,1]+x[,2]+as.matrix(rnorm(100))
dr <- mave(y~x)
x.reduced <- mave.data(dr,x,3)



