library(ade4)


### Name: housetasks
### Title: Contingency Table
### Aliases: housetasks
### Keywords: datasets

### ** Examples

data(housetasks)
nsc1 <- dudi.nsc(housetasks, scan = FALSE)

if(adegraphicsLoaded()) {
  s.label(nsc1$c1, plab.cex = 1.25)
  s.arrow(nsc1$li, add = TRUE, plab.cex = 0.75)
} else {
  s.label(nsc1$c1, clab = 1.25)
  s.arrow(nsc1$li, add.pl = TRUE, clab = 0.75) 
}


