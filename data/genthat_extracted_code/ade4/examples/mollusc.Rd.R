library(ade4)


### Name: mollusc
### Title: Faunistic Communities and Sampling Experiment
### Aliases: mollusc
### Keywords: datasets

### ** Examples

data(mollusc)
coa1 <- dudi.coa(log(mollusc$fau + 1), scannf = FALSE, nf = 3)

if(adegraphicsLoaded()) {
  g1 <- s.class(coa1$li, mollusc$plan$site, ellipseSize = 0, starSize = 0, chullSize = 1, 
    xax = 2, yax = 3, plot = FALSE)
  g2 <- s.class(coa1$li, mollusc$plan$season, ellipseSize = 0, starSize = 0, chullSize = 1, 
    xax = 2, yax = 3, plot = FALSE)
  g3 <- s.class(coa1$li, mollusc$plan$method, ellipseSize = 0, starSize = 0, chullSize = 1, 
    xax = 2, yax = 3, plot = FALSE)
  g4 <- s.class(coa1$li, mollusc$plan$duration, ellipseSize = 0, starSize = 0, chullSize = 1, 
    xax = 2, yax = 3, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.chull(coa1$li, mollusc$plan$site, 2, 3, opt = 1, cpoi = 1)
  s.chull(coa1$li, mollusc$plan$season, 2, 3, opt = 1, cpoi = 1)
  s.chull(coa1$li, mollusc$plan$method, 2, 3, opt = 1, cpoi = 1)
  s.chull(coa1$li, mollusc$plan$duration, 2, 3, opt = 1, cpoi = 1)
  par(mfrow = c(1, 1))
}


