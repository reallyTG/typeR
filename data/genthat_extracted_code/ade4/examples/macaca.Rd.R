library(ade4)


### Name: macaca
### Title: Landmarks
### Aliases: macaca
### Keywords: datasets

### ** Examples

data(macaca)
pro1 <- procuste(macaca$xy1, macaca$xy2, scal = FALSE)
pro2 <- procuste(macaca$xy1, macaca$xy2)
  
if(adegraphicsLoaded()) {
  g1 <- s.match(macaca$xy1, macaca$xy2, plab.cex = 0, plot = FALSE)
  g2 <- s.match(pro1$tabX, pro1$rotY, plab.cex = 0.7, plot = FALSE)
  g3 <- s.match(pro1$tabY, pro1$rotX, plab.cex = 0.7, plot = FALSE)
  g4 <- s.match(pro2$tabY, pro2$rotX, plab.cex = 0.7, plot = FALSE)
  G <- ADEgS(c(g1, g2, g3, g4), layout = c(2, 2))

} else {
  par(mfrow = c(2,2))
  s.match(macaca$xy1, macaca$xy2, clab = 0)
  s.match(pro1$tabX, pro1$rotY, clab = 0.7)
  s.match(pro1$tabY, pro1$rotX, clab = 0.7)
  s.match(pro2$tabY, pro2$rotX, clab = 0.7)
  par(mfrow = c(1,1))
}


