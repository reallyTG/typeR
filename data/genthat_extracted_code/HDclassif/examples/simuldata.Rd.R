library(HDclassif)


### Name: simuldata
### Title: Gaussian Data Generation
### Aliases: simuldata
### Keywords: generation gaussian

### ** Examples

data <- simuldata(500, 1000, 50, K=5, prop=c(0.2,0.25,0.25,0.15,0.15))
X <- data$X
clx <- data$clx
f <- hdda(X, clx)
Y <- data$Y
cly <- data$cly
e <- predict(f, Y, cly)




