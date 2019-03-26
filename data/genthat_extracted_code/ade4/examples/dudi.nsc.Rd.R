library(ade4)


### Name: dudi.nsc
### Title: Non symmetric correspondence analysis
### Aliases: dudi.nsc
### Keywords: multivariate

### ** Examples

data(housetasks)
nsc1 <- dudi.nsc(housetasks, scan = FALSE)
if(adegraphicsLoaded()) {
  g1 <- s.label(nsc1$c1, plab.cex = 1.25)
  g2 <- s.arrow(nsc1$li, add = TRUE, plab.cex = 0.75)
} else {
  s.label(nsc1$c1, clab = 1.25)
  s.arrow(nsc1$li, add.pl = TRUE, clab = 0.75) # see ref p.383
}


