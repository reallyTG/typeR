library(ade4)


### Name: dudi.fca
### Title: Fuzzy Correspondence Analysis and Fuzzy Principal Components
###   Analysis
### Aliases: dudi.fca dudi.fpca prep.fuzzy.var
### Keywords: multivariate

### ** Examples

w1 <- matrix(c(1,0,0,2,1,1,0,2,2,0,1,0,1,1,1,0,1,3,1,0), 4, 5)
w1 <- data.frame(w1) 
w2 <- prep.fuzzy.var(w1, c(2, 3))
w1
w2 
attributes(w2)

data(bsetal97)
w <- prep.fuzzy.var(bsetal97$biol, bsetal97$biol.blo)

if(adegraphicsLoaded()) {
  g1 <- plot(dudi.fca(w, scann = FALSE, nf = 3), plabels.cex = 1.5)
} else {
  scatter(dudi.fca(w, scann = FALSE, nf = 3), csub = 3, clab.moda = 1.5)
  scatter(dudi.fpca(w, scann = FALSE, nf = 3), csub = 3, clab.moda = 1.5)
}

## Not run: 
##D w1 <- prep.fuzzy.var(bsetal97$biol, bsetal97$biol.blo)
##D w2 <- prep.fuzzy.var(bsetal97$ecol, bsetal97$ecol.blo)
##D d1 <- dudi.fca(w1, scannf = FALSE, nf = 3)
##D d2 <- dudi.fca(w2, scannf = FALSE, nf = 3)
##D plot(coinertia(d1, d2, scannf = FALSE))
## End(Not run)




