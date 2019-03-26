library(ade4)


### Name: euro123
### Title: Triangular Data
### Aliases: euro123
### Keywords: datasets

### ** Examples

data(euro123)

if(adegraphicsLoaded()) {
  g1 <- triangle.label(euro123$in78, addaxes = TRUE, plabels.cex = 0, 
    plot = FALSE)
  g2 <- triangle.label(euro123$in86, addaxes = TRUE, plabels.cex = 0, 
    plot = FALSE)
  g3 <- triangle.label(euro123$in97, addaxes = TRUE, plabels.cex = 0, 
    plot = FALSE)
  g4 <- triangle.match(euro123$in78, euro123$in97, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
} else {
  par(mfrow = c(2,2))
  triangle.plot(euro123$in78, addaxes = TRUE)
  triangle.plot(euro123$in86, addaxes = TRUE)
  triangle.plot(euro123$in97, addaxes = TRUE)
  triangle.biplot(euro123$in78, euro123$in97)
  par(mfrow = c(1,1))
}


