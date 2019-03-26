library(spatstat)


### Name: as.hyperframe.ppx
### Title: Extract coordinates and marks of multidimensional point pattern
### Aliases: as.hyperframe.ppx as.data.frame.ppx as.matrix.ppx
### Keywords: spatial manip

### ** Examples

   df <- data.frame(x=runif(4),y=runif(4),t=runif(4))
   X <- ppx(data=df, coord.type=c("s","s","t"))
   as.data.frame(X)
   val <- runif(4)
   E <- lapply(val, function(s) { rpoispp(s) })
   hf <- hyperframe(t=val, e=as.listof(E))
   Z <- ppx(data=hf, domain=c(0,1))
   as.hyperframe(Z)
   as.data.frame(Z)



