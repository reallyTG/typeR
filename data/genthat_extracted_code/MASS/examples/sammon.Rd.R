library(MASS)


### Name: sammon
### Title: Sammon's Non-Linear Mapping
### Aliases: sammon
### Keywords: multivariate

### ** Examples

swiss.x <- as.matrix(swiss[, -1])
swiss.sam <- sammon(dist(swiss.x))
plot(swiss.sam$points, type = "n")
text(swiss.sam$points, labels = as.character(1:nrow(swiss.x)))



