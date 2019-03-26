library(spatstat)


### Name: textureplot
### Title: Plot Image or Tessellation Using Texture Fill
### Aliases: textureplot
### Keywords: spatial hplot

### ** Examples

  nd <- if(interactive()) 128 else 32
  Z <- setcov(owin(), dimyx=nd)
  Zcut <- cut(Z, 3, labels=c("Lo", "Med", "Hi"))
  textureplot(Zcut)
  textureplot(dirichlet(runifpoint(6)))



