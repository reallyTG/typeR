library(adegraphics)


### Name: s.match
### Title: 2-D scatter plot of the matching between two sets of coordinates
### Aliases: s.match
### Keywords: aplot hplot

### ** Examples

X <- data.frame(x = runif(50, -1, 2), y = runif(50, -1, 2))
Y <- X + rnorm(100, sd = 0.3)
g1 <- s.match(X, Y, arr = TRUE, ppoints.cex = 2, ppoints.col = c("blue", "green"))

data(doubs, package = "ade4")
dudi1 <- ade4::dudi.pca(doubs$env, scale = TRUE, scannf = FALSE, nf = 3)
dudi2 <- ade4::dudi.pca(doubs$fish, scale = FALSE, scannf = FALSE, nf = 2)
coin1 <- ade4::coinertia(dudi1, dudi2, scannf = FALSE, nf = 2)
g2 <- s.match(dfxy1 = coin1$mX, dfxy2 = coin1$mY)



