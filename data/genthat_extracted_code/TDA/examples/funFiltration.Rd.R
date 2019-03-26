library(TDA)


### Name: funFiltration
### Title: Filtration from function values
### Aliases: funFiltration
### Keywords: methods

### ** Examples

n <- 5
X <- cbind(cos(2*pi*seq_len(n)/n), sin(2*pi*seq_len(n)/n))
maxdimension <- 1
maxscale <- 1.5
dist <- "euclidean"
library <- "Dionysus"

FltRips <- ripsFiltration(X = X, maxdimension = maxdimension,
               maxscale = maxscale, dist = "euclidean", library = "Dionysus",
               printProgress = TRUE)

FUNvalues <- X[, 1] + X[, 2]

FltFun <- funFiltration(FUNvalues = FUNvalues, cmplx = FltRips[["cmplx"]])



