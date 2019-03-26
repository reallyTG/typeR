library(spatstat)


### Name: connected.tess
### Title: Connected Components of Tiles of a Tessellation
### Aliases: connected.tess
### Keywords: spatial math

### ** Examples

  BB <- grow.rectangle(Frame(letterR), 0.2)
  H <- tess(tiles=list(IN=letterR, OUT=complement.owin(letterR, BB)))
  opa <- par(mfrow=c(1,2))
  plot(H, do.col=TRUE)
  plot(connected(H), do.col=TRUE, col=2:4)
  par(opa)



