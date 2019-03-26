library(TDA)


### Name: ripsFiltration
### Title: Rips Filtration
### Aliases: ripsFiltration
### Keywords: methods

### ** Examples

n <- 5
X <- cbind(cos(2*pi*seq_len(n)/n), sin(2*pi*seq_len(n)/n))
maxdimension <- 1
maxscale <- 1.5

FltRips <- ripsFiltration(X = X, maxdimension = maxdimension,
               maxscale = maxscale, dist = "euclidean", library = "GUDHI",
               printProgress = TRUE)

# plot rips filtration
lim <- rep(c(-1, 1), 2)
plot(NULL, type = "n", xlim = lim[1:2], ylim = lim[3:4],
    main = "Rips Filtration Plot")
for (idx in seq(along = FltRips[["cmplx"]])) {
  polygon(FltRips[["coordinates"]][FltRips[["cmplx"]][[idx]], , drop = FALSE],
      col = "pink", border = NA, xlim = lim[1:2], ylim = lim[3:4])
}
for (idx in seq(along = FltRips[["cmplx"]])) {
  polygon(FltRips[["coordinates"]][FltRips[["cmplx"]][[idx]], , drop = FALSE],
      col = NULL, xlim = lim[1:2], ylim = lim[3:4])
}  
points(FltRips[["coordinates"]], pch = 16)



