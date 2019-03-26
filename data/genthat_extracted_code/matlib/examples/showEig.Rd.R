library(matlib)


### Name: showEig
### Title: Show the eigenvectors associated with a covariance matrix
### Aliases: showEig

### ** Examples

x <- rnorm(200)
y <- .5 * x + .5 * rnorm(200)
X <- cbind(x,y)
showEig(X)

# Duncan data
data(Duncan, package="carData")
showEig(Duncan[, 2:3], levels=0.68)
showEig(Duncan[,2:3], levels=0.68, robust=TRUE, add=TRUE, fill=TRUE)



