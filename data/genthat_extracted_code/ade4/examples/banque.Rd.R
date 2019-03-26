library(ade4)


### Name: banque
### Title: Table of Factors
### Aliases: banque
### Keywords: datasets

### ** Examples

data(banque)
banque.acm <- dudi.acm(banque, scannf = FALSE, nf = 3)
apply(banque.acm$cr, 2, mean)
banque.acm$eig[1:banque.acm$nf] # the same thing

if(adegraphicsLoaded()) {
  g <- s.arrow(banque.acm$c1, plabels.cex = 0.75)
} else {
  s.arrow(banque.acm$c1, clab = 0.75)
}


