library(TDA)


### Name: alphaComplexFiltration
### Title: Alpha Complex Filtration
### Aliases: alphaComplexFiltration
### Keywords: methods

### ** Examples

# input data generated from a circle
X <- circleUnif(n = 10)

# alpha complex filtration
FltAlphaComplex <- alphaComplexFiltration(X = X, printProgress = TRUE)

# plot alpha complex filtration
lim <- rep(c(-1, 1), 2)
plot(NULL, type = "n", xlim = lim[1:2], ylim = lim[3:4],
    main = "Alpha Complex Filtration Plot")
for (idx in seq(along = FltAlphaComplex[["cmplx"]])) {
  polygon(FltAlphaComplex[["coordinates"]][FltAlphaComplex[["cmplx"]][[idx]], , drop = FALSE],
      col = "pink", border = NA, xlim = lim[1:2], ylim = lim[3:4])
}
for (idx in seq(along = FltAlphaComplex[["cmplx"]])) {
  polygon(FltAlphaComplex[["coordinates"]][FltAlphaComplex[["cmplx"]][[idx]], , drop = FALSE],
      col = NULL, xlim = lim[1:2], ylim = lim[3:4])
}  
points(FltAlphaComplex[["coordinates"]], pch = 16)



