library(TDA)


### Name: alphaShapeDiag
### Title: Persistence Diagram of Alpha Shape in 3d
### Aliases: alphaShapeDiag
### Keywords: methods

### ** Examples

# input data generated from cylinder
n <- 30
X <- cbind(circleUnif(n = n), runif(n = n, min = -0.1, max = 0.1))

# persistence diagram of alpha shape
DiagAlphaShape <- alphaShapeDiag(
    X = X, maxdimension = 1, library = c("GUDHI", "Dionysus"), location = TRUE,
    printProgress = TRUE)

# plot diagram and first two dimension of data
par(mfrow = c(1, 2))
plot(DiagAlphaShape[["diagram"]])
plot(X[, 1:2], col = 2, main = "Representative loop of alpha shape filtration")
one <- which(DiagAlphaShape[["diagram"]][, 1] == 1)
one <- one[which.max(
    DiagAlphaShape[["diagram"]][one, 3] - DiagAlphaShape[["diagram"]][one, 2])]
for (i in seq(along = one)) {
  for (j in seq_len(dim(DiagAlphaShape[["cycleLocation"]][[one[i]]])[1])) {
    lines(
        DiagAlphaShape[["cycleLocation"]][[one[i]]][j, , 1:2], pch = 19,
        cex = 1, col = i)
  }
}
par(mfrow = c(1, 1))



