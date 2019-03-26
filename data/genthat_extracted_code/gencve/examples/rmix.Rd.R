library(gencve)


### Name: rmix
### Title: Random Mixture Classification Example
### Aliases: rmix
### Keywords: models classif datagen

### ** Examples

mdf <- rmix(200)
gr <- mdf[mdf$y=="green",]
rd <- mdf[mdf$y=="red",]
with(mdf, {plot(x1, x2, type="n")
  points(gr, col="green")
  points(rd, col="red")
  })



