library(codep)


### Name: codep-package
### Title: Multiscale Codependence Analysis
### Aliases: codep-package codep
### Keywords: package

### ** Examples

data(Mite)
emap <- eigenmap(x = mite.geo,weighting=Wf.RBF,wpar=0.1)
emap
# Organize the environmental variables
mca0 <- MCA(Y = log1p(mite.species), X = mite.env, emobj = emap)
mca0_partest <- test.cdp(mca0, response.tests = FALSE)
summary(mca0_partest)
plot(mca0_partest, las = 2, lwd = 2)
plot(mca0_partest, col = rainbow(1200)[1L:1000], las = 3, lwd = 4,
     main = "Codependence diagram", col.signif = "white")
#
rng <- list(x = seq(min(mite.geo[,"x"]) - 0.1, max(mite.geo[,"x"]) + 0.1, 0.05),
            y = seq(min(mite.geo[,"y"]) - 0.1, max(mite.geo[,"y"]) + 0.1, 0.05))
grid <- cbind(x = rep(rng[["x"]], length(rng[["y"]])),
              y = rep(rng[["y"]], each = length(rng[["x"]])))
newdists <- matrix(NA, nrow(grid), nrow(mite.geo))
for(i in 1L:nrow(grid)) {
  newdists[i,] <- ((mite.geo[,"x"] - grid[i,"x"])^2 +
                    (mite.geo[,"y"] - grid[i,"y"])^2)^0.5
}
#
spmeans <- colMeans(mite.species)
pca0 <- svd(log1p(mite.species) - rep(spmeans, each = nrow(mite.species)))
#
prd0 <- predict(mca0_partest,
                newdata = list(target = eigenmap.score(emap, newdists)))
Uprd0 <- (prd0 - rep(spmeans, each = nrow(prd0))) 
#
### Printing the response variable
prmat <- Uprd0[,1L]
dim(prmat) <- c(length(rng$x),length(rng$y))
zlim <- c(min(min(prmat),min(pca0$u[,1L])),max(max(prmat),max(pca0$u[,1L])))
image(z = prmat, x = rng$x, y = rng$y, asp = 1, zlim = zlim,
      col = rainbow(1200L)[1L:1000], ylab = "y", xlab = "x")
points(x = mite.geo[,"x"], y = mite.geo[,"y"], pch = 21,
       bg = rainbow(1200L)[round(1+(999*(pca0$u[,1L]-zlim[1L])/(zlim[2L]-zlim[1L])),0)])
#



