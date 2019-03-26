library(adegenet)


### Name: find.clusters
### Title: find.cluster: cluster identification using successive K-means
### Aliases: find.clusters find.clusters.data.frame find.clusters.matrix
###   find.clusters.genind find.clusters.genlight .find.sub.clusters
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## THIS ONE TAKES A FEW MINUTES TO RUN ## 
##D data(eHGDP)
##D 
##D ## here, n.clust is specified, so that only on K value is used
##D grp <- find.clusters(eHGDP, max.n=30, n.pca=200, scale=FALSE,
##D n.clust=4) # takes about 2 minutes
##D names(grp)
##D grp$Kstat
##D grp$stat
##D 
##D 
##D ## to try different values of k (interactive)
##D grp <- find.clusters(eHGDP, max.n=50, n.pca=200, scale=FALSE)
##D 
##D ## and then, to plot BIC values:
##D plot(grp$Kstat, type="b", col="blue")
##D 
##D 
##D 
##D ## ANOTHER SIMPLE EXAMPLE ## 
##D data(sim2pop) # this actually contains 2 pop
##D 
##D ## DETECTION WITH BIC (clear result)
##D foo.BIC <- find.clusters(sim2pop, n.pca=100, choose=FALSE)
##D plot(foo.BIC$Kstat, type="o", xlab="number of clusters (K)", ylab="BIC",
##D col="blue", main="Detection based on BIC")
##D points(2, foo.BIC$Kstat[2], pch="x", cex=3)
##D mtext(3, tex="'X' indicates the actual number of clusters")
##D 
##D 
##D ## DETECTION WITH AIC (less clear-cut)
##D foo.AIC <- find.clusters(sim2pop, n.pca=100, choose=FALSE, stat="AIC")
##D plot(foo.AIC$Kstat, type="o", xlab="number of clusters (K)",
##D ylab="AIC", col="purple", main="Detection based on AIC")
##D points(2, foo.AIC$Kstat[2], pch="x", cex=3)
##D mtext(3, tex="'X' indicates the actual number of clusters")
##D 
##D 
##D ## DETECTION WITH WSS (less clear-cut)
##D foo.WSS <- find.clusters(sim2pop, n.pca=100, choose=FALSE, stat="WSS")
##D plot(foo.WSS$Kstat, type="o", xlab="number of clusters (K)", ylab="WSS
##D (residual variance)", col="red", main="Detection based on WSS")
##D points(2, foo.WSS$Kstat[2], pch="x", cex=3)
##D mtext(3, tex="'X' indicates the actual number of clusters")
##D 
##D 
##D ## TOY EXAMPLE FOR GENLIGHT OBJECTS ##
##D x <- glSim(100,500,500)
##D x
##D plot(x)
##D grp <- find.clusters(x, n.pca = 100, choose = FALSE, stat = "BIC")
##D plot(grp$Kstat, type = "o", xlab = "number of clusters (K)",
##D      ylab = "BIC",
##D      main = "find.clusters on a genlight object\n(two groups)")
## End(Not run)



