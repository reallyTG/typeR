library(spatstat)


### Name: layerplotargs
### Title: Extract or Replace the Plot Arguments of a Layered Object
### Aliases: layerplotargs layerplotargs<-
### Keywords: spatial hplot

### ** Examples

   W <- square(2)
   L <- layered(W=W, X=cells)
   ## The following are equivalent
   layerplotargs(L) <- list(list(), list(pch=16))
   layerplotargs(L)[[2]] <- list(pch=16)
   layerplotargs(L)$X <- list(pch=16)

   ## The following are equivalent
   layerplotargs(L) <- list(list(cex=2), list(cex=2))
   layerplotargs(L) <- list(list(cex=2))



