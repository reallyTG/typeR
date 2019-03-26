library(TDA)


### Name: alphaComplexDiag
### Title: Alpha Complex Persistence Diagram
### Aliases: alphaComplexDiag
### Keywords: methods

### ** Examples

# input data generated from a circle
X <- circleUnif(n = 30)

# persistence diagram of alpha complex
DiagAlphaCmplx <- alphaComplexDiag(
    X = X, library = c("GUDHI", "Dionysus"), location = TRUE,
    printProgress = TRUE)

# plot
par(mfrow = c(1, 2))
plot(DiagAlphaCmplx[["diagram"]])
one <- which(DiagAlphaCmplx[["diagram"]][, 1] == 1)
one <- one[which.max(
    DiagAlphaCmplx[["diagram"]][one, 3] - DiagAlphaCmplx[["diagram"]][one, 2])]
plot(X, col = 2, main = "Representative loop of data points")
for (i in seq(along = one)) {
  for (j in seq_len(dim(DiagAlphaCmplx[["cycleLocation"]][[one[i]]])[1])) {
    lines(
        DiagAlphaCmplx[["cycleLocation"]][[one[i]]][j, , ], pch = 19, cex = 1,
        col = i)
  }
}
par(mfrow = c(1, 1))




