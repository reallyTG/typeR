library(adegenet)


### Name: dapc graphics
### Title: Graphics for Discriminant Analysis of Principal Components
###   (DAPC)
### Aliases: scatter.dapc assignplot
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(H3N2)
##D dapc1 <- dapc(H3N2, pop=H3N2$other$epid, n.pca=30,n.da=6)
##D 
##D ## defautl plot ##
##D scatter(dapc1)
##D 
##D ## label individuals at the periphery
##D # air = 2 is a measure of how much space each label needs
##D # pch = NA suppresses plotting of points
##D scatter(dapc1, label.inds = list(air = 2, pch = NA))
##D 
##D ## showing different scatter options ##
##D ## remove internal segments and ellipses, different pch, add MStree
##D scatter(dapc1, pch=18:23, cstar=0, mstree=TRUE, lwd=2, lty=2, posi.da="topleft")
##D 
##D ## only ellipse, custom labels, use insets
##D scatter(dapc1, cell=2, pch="", cstar=0, posi.pca="topleft", posi.da="topleft", scree.pca=TRUE,
##D inset.pca=c(.01,.3), label=paste("year\n",2001:2006), axesel=FALSE, col=terrain.colors(10))
##D 
##D ## without ellipses, use legend for groups
##D scatter(dapc1, cell=0, cstar=0, scree.da=FALSE, clab=0, cex=3,
##D solid=.4, bg="white", leg=TRUE, posi.leg="topleft")
##D 
##D ## only one axis
##D scatter(dapc1,1,1,scree.da=FALSE, legend=TRUE, solid=.4,bg="white")
##D 
##D 
##D 
##D ## example using genlight objects ##
##D ## simulate data
##D x <- glSim(50,4e3-50, 50, ploidy=2)
##D x
##D plot(x)
##D 
##D ## perform DAPC
##D dapc2 <- dapc(x, n.pca=10, n.da=1)
##D dapc2
##D 
##D ## plot results
##D scatter(dapc2, scree.da=FALSE, leg=TRUE, txt.leg=paste("group",
##D c('A','B')), col=c("red","blue"))
##D 
##D ## SNP contributions
##D loadingplot(dapc2$var.contr)
##D loadingplot(tail(dapc2$var.contr, 100), main="Loading plot - last 100 SNPs")
##D 
##D 
##D 
##D ## assignplot / compoplot ##
##D assignplot(dapc1, only.grp=2006)
##D 
##D data(microbov)
##D dapc3 <- dapc(microbov, n.pca=20, n.da=15)
##D compoplot(dapc3, lab="")
## End(Not run)



