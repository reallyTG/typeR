library(psych)


### Name: geometric.mean
### Title: Find the geometric mean of a vector or columns of a data.frame.
### Aliases: geometric.mean
### Keywords: multivariate

### ** Examples


x <- seq(1,5)
x2 <- x^2
x2[2] <- NA
X <- data.frame(x,x2)
geometric.mean(x)
geometric.mean(x2)
geometric.mean(X)
geometric.mean(X,na.rm=FALSE)




