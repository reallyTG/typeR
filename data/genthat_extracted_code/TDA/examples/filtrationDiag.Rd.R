library(TDA)


### Name: filtrationDiag
### Title: Persistence Diagram of Filtration
### Aliases: filtrationDiag
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

DiagFltRips <- filtrationDiag(filtration = FltRips, maxdimension = maxdimension,
                   library = "Dionysus", location = TRUE, printProgress = TRUE)

plot(DiagFltRips[["diagram"]])


FUNvalues <- X[, 1] + X[, 2]

FltFun <- funFiltration(FUNvalues = FUNvalues, cmplx = FltRips[["cmplx"]])

DiagFltFun <- filtrationDiag(filtration = FltFun, maxdimension = maxdimension,
                             library = "Dionysus", location = TRUE, printProgress = TRUE)

plot(DiagFltFun[["diagram"]], diagLim = c(-2, 5))



