library(spatstat)


### Name: intersect.tess
### Title: Intersection of Two Tessellations
### Aliases: intersect.tess
### Keywords: spatial math

### ** Examples

  opa <- par(mfrow=c(1,3))
# polygon
  data(letterR)
  plot(letterR)
# tessellation of rectangles
  X <- tess(xgrid=seq(2, 4, length=10), ygrid=seq(0, 3.5, length=8))
  plot(X)
  plot(intersect.tess(X, letterR))

  A <- runifpoint(10)
  B <- runifpoint(10)
  plot(DA <- dirichlet(A))
  plot(DB <- dirichlet(B))
  plot(intersect.tess(DA, DB))
  par(opa)

  marks(DA) <- 1:10
  marks(DB) <- 1:10
  plot(Z <- intersect.tess(DA,DB, keepmarks=TRUE))
  mZ <- marks(Z)
  tZ <- tiles(Z)
  for(i in which(mZ[,1] == 3)) plot(tZ[[i]], add=TRUE, col="pink")



