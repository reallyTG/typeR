library(ade4)


### Name: gearymoran
### Title: Moran's I and Geary'c randomization tests for spatial and
###   phylogenetic autocorrelation
### Aliases: gearymoran
### Keywords: spatial ts

### ** Examples

# a spatial example
data(mafragh)
tab0 <- (as.data.frame(scalewt(mafragh$env)))
bilis0 <- neig2mat(mafragh$neig)
gm0 <- gearymoran(bilis0, tab0, 999)
gm0
plot(gm0, nclass = 20)

## Not run: 
##D # a phylogenetic example
##D data(mjrochet)
##D mjr.phy <- newick2phylog(mjrochet$tre)
##D mjr.tab <- log(mjrochet$tab)
##D gearymoran(mjr.phy$Amat, mjr.tab)
##D gearymoran(mjr.phy$Wmat, mjr.tab)
##D 
##D if(adegraphicsLoaded()) {
##D   g1 <- table.value(mjr.phy$Wmat, ppoints.cex = 0.35, nclass = 5,
##D     axis.text = list(cex = 0), plot = FALSE)
##D   g2 <- table.value(mjr.phy$Amat, ppoints.cex = 0.35, nclass = 5,
##D     axis.text = list(cex = 0), plot = FALSE)
##D   G <- cbindADEg(g1, g2, plot = TRUE)
##D   
##D } else {
##D   par(mfrow = c(1, 2))
##D   table.value(mjr.phy$Wmat, csi = 0.25, clabel.r = 0)
##D   table.value(mjr.phy$Amat, csi = 0.35, clabel.r = 0)
##D   par(mfrow = c(1, 1))
##D }
## End(Not run)


