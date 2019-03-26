library(RZigZag)


### Name: ZigZagLogistic
### Title: ZigZagLogistic
### Aliases: ZigZagLogistic

### ** Examples

require("RZigZag")
generate.logistic.data <- function(beta, n.obs) {
  dim <- length(beta)
  dataX <- rbind(rep(1, n.obs), matrix(rnorm((dim -1) * n.obs), nrow = dim -1));
  vals <- colSums(dataX * as.vector(beta))
  generateY <- function(p) { rbinom(1, 1, p)}
  dataY <- sapply(1/(1 + exp(-vals)), generateY)
  return(list(dataX, dataY))
}

beta <- c(1,2)
data <- generate.logistic.data(beta, 1000)
result <- ZigZagLogistic(data[[1]], data[[2]], 1000, n_samples = 100)
plot(result$skeletonPoints[1,], result$skeletonPoints[2,],type='l',asp=1)
points(result$samples[1,], result$samples[2,], col='magenta')



