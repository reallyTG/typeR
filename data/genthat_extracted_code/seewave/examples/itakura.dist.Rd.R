library(seewave)


### Name: itakura.dist
### Title: Itakuro-Saito distance
### Aliases: itakura.dist
### Keywords: distribution ts

### ** Examples

# Comparison of two spectra
data(tico)
tico1 <- spec(tico, at=0.65, plot=FALSE)
tico2 <- spec(tico, at=1.1, plot=FALSE)
itakura.dist(tico1, tico2)
itakura.dist(tico1, tico2, scale=TRUE) 



