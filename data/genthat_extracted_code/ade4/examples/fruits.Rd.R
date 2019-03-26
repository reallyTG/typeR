library(ade4)


### Name: fruits
### Title: Pair of Tables
### Aliases: fruits
### Keywords: datasets

### ** Examples
 
data(fruits)
pcajug <- dudi.pca(fruits$jug, scann = FALSE)
pcavar <- dudi.pca(fruits$var, scann = FALSE)

if(adegraphicsLoaded()) {
  g1 <- s.corcircle(pcajug$co, plot = FALSE)
  g2 <- s.class(pcajug$li, fac = fruits$type, plot = FALSE)
  g3 <- s.corcircle(pcavar$co, plot = FALSE)
  g4 <- s.class(pcavar$li, fac = fruits$type, plot = FALSE)
  
  G1 <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  G2 <- plot(coinertia(pcajug, pcavar, scan = FALSE))

} else {
  par(mfrow = c(2,2)) 
  s.corcircle(pcajug$co)
  s.class(pcajug$li, fac = fruits$type)
  s.corcircle(pcavar$co)
  s.class(pcavar$li, fac = fruits$type)
  
  par(mfrow = c(1,1))
  plot(coinertia(pcajug, pcavar, scan = FALSE))
}



