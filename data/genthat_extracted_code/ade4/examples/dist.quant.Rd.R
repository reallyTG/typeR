library(ade4)


### Name: dist.quant
### Title: Computation of Distance Matrices on Quantitative Variables
### Aliases: dist.quant
### Keywords: array multivariate

### ** Examples

data(ecomor)

if(adegraphicsLoaded()) {
  g1 <- scatter(dudi.pco(dist.quant(ecomor$morpho, 3), scan = FALSE), plot = FALSE)
  g2 <- scatter(dudi.pco(dist.quant(ecomor$morpho, 2), scan = FALSE), plot = FALSE)
  g3 <- scatter(dudi.pco(dist(scalewt(ecomor$morpho)), scan = FALSE), plot = FALSE)
  g4 <- scatter(dudi.pco(dist.quant(ecomor$morpho, 1), scan = FALSE), plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  scatter(dudi.pco(dist.quant(ecomor$morpho, 3), scan = FALSE))
  scatter(dudi.pco(dist.quant(ecomor$morpho, 2), scan = FALSE))
  scatter(dudi.pco(dist(scalewt(ecomor$morpho)), scan = FALSE))
  scatter(dudi.pco(dist.quant(ecomor$morpho, 1), scan = FALSE))
  par(mfrow = c(1, 1))
}


