library(ade4)


### Name: coinertia
### Title: Coinertia Analysis
### Aliases: coinertia print.coinertia plot.coinertia summary.coinertia
### Keywords: multivariate

### ** Examples

data(doubs)
dudi1 <- dudi.pca(doubs$env, scale = TRUE, scan = FALSE, nf = 3)
dudi2 <- dudi.pca(doubs$fish, scale = FALSE, scan = FALSE, nf = 2)
coin1 <- coinertia(dudi1,dudi2, scan = FALSE, nf = 2)
coin1
summary(coin1)

if(adegraphicsLoaded()) {
  g1 <- s.arrow(coin1$l1, plab.cex = 0.7)
  g2 <- s.arrow(coin1$c1, plab.cex = 0.7)
  g3 <- s.corcircle(coin1$aX, plot = FALSE)
  g4 <- s.corcircle(coin1$aY, plot = FALSE)
  cbindADEg(g3, g4, plot = TRUE)
  g5 <- plot(coin1)
    
} else {
s.arrow(coin1$l1, clab = 0.7)
s.arrow(coin1$c1, clab = 0.7)
par(mfrow = c(1,2))
s.corcircle(coin1$aX)
s.corcircle(coin1$aY)
par(mfrow = c(1,1))
plot(coin1)
}


