library(adegenet)


### Name: eHGDP
### Title: Extended HGDP-CEPH dataset
### Aliases: eHGDP
### Keywords: datasets

### ** Examples


## Not run: 
##D ## LOAD DATA
##D data(eHGDP)
##D eHGDP
##D 
##D 
##D ## PERFORM DAPC - USE POPULATIONS AS CLUSTERS
##D ## to reproduce exactly analyses from the paper, use "n.pca=1000"
##D dapc1 <- dapc(eHGDP, all.contrib=TRUE, scale=FALSE,
##D n.pca=200, n.da=80) # takes 2 minutes
##D dapc1
##D 
##D ## (see ?dapc for details about the output)
##D 
##D 
##D 
##D ## SCREEPLOT OF EIGENVALUES
##D barplot(dapc1$eig, main="eHGDP - DAPC eigenvalues",
##D col=c("red","green","blue", rep("grey", 1000)))
##D 
##D 
##D 
##D ## SCATTERPLOTS
##D ## (!) Note: colors may be inverted with respect to [5]
##D ## as signs of principal components are arbitrary
##D ## and change from one computer to another
##D ##
##D ## axes 1-2
##D s.label(dapc1$grp.coord[,1:2], clab=0, sub="Axes 1-2")
##D par(xpd=T)
##D colorplot(dapc1$grp.coord[,1:2], dapc1$grp.coord, cex=3, add=TRUE)
##D add.scatter.eig(dapc1$eig,10,1,2, posi="bottomright", ratio=.3, csub=1.25)
##D 
##D ## axes 2-3
##D s.label(dapc1$grp.coord[,2:3], clab=0, sub="Axes 2-3")
##D par(xpd=T)
##D colorplot(dapc1$grp.coord[,2:3], dapc1$grp.coord, cex=3, add=TRUE)
##D add.scatter.eig(dapc1$eig,10,1,2, posi="bottomright", ratio=.3, csub=1.25)
##D 
##D 
##D 
##D ## MAP DAPC1 RESULTS
##D if(require(maps)){
##D 
##D xy <- cbind(eHGDP$other$popInfo$Longitude, eHGDP$other$popInfo$Latitude)
##D 
##D par(mar=rep(.1,4))
##D map(fill=TRUE, col="lightgrey")
##D colorplot(xy, -dapc1$grp.coord, cex=3, add=TRUE, trans=FALSE)
##D }
##D 
##D 
##D 
##D ## LOOK FOR OTHER CLUSTERS
##D ## to reproduce results of the reference paper, use :
##D ## grp <- find.clusters(eHGDP, max.n=50, n.pca=200, scale=FALSE)
##D ## and then
##D ## plot(grp$Kstat, type="b", col="blue")
##D 
##D grp <- find.clusters(eHGDP, max.n=30, n.pca=200,
##D scale=FALSE, n.clust=4) # takes about 2 minutes
##D names(grp)
##D 
##D ## (see ?find.clusters for details about the output)
##D 
##D 
##D 
##D ## PERFORM DAPC - USE POPULATIONS AS CLUSTERS
##D ## to reproduce exactly analyses from the paper, use "n.pca=1000"
##D dapc2 <- dapc(eHGDP, pop=grp$grp, all.contrib=TRUE,
##D scale=FALSE, n.pca=200, n.da=80) # takes around a 1 minute
##D dapc2
##D 
##D 
##D ## PRODUCE SCATTERPLOT
##D scatter(dapc2) # axes 1-2
##D scatter(dapc2,2,3) # axes 2-3
##D 
##D 
##D ## MAP DAPC2 RESULTS
##D if(require(maps)){
##D xy <- cbind(eHGDP$other$popInfo$Longitude,
##D eHGDP$other$popInfo$Latitude)
##D 
##D myCoords <- apply(dapc2$ind.coord, 2, tapply, pop(eHGDP), mean)
##D 
##D par(mar=rep(.1,4))
##D map(fill=TRUE, col="lightgrey")
##D colorplot(xy, myCoords, cex=3, add=TRUE, trans=FALSE)
##D }
##D 
## End(Not run)




