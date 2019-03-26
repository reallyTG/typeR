library(adegenet)


### Name: dapcIllus
### Title: Simulated data illustrating the DAPC
### Aliases: dapcIllus
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D data(dapcIllus)
##D attach(dapcIllus)
##D a # this is a genind object, like b, c, and d.
##D 
##D 
##D ## FINS CLUSTERS EX NIHILO
##D clust.a <- find.clusters(a, n.pca=100, n.clust=6)
##D clust.b <- find.clusters(b, n.pca=100, n.clust=6)
##D clust.c <- find.clusters(c, n.pca=100, n.clust=12)
##D clust.d <- find.clusters(d, n.pca=100, n.clust=24)
##D 
##D ## examin outputs
##D names(clust.a)
##D lapply(clust.a, head)
##D 
##D 
##D ## PERFORM DAPCs
##D dapc.a <- dapc(a, pop=clust.a$grp, n.pca=100, n.da=5)
##D dapc.b <- dapc(b, pop=clust.b$grp, n.pca=100, n.da=5)
##D dapc.c <- dapc(c, pop=clust.c$grp, n.pca=100, n.da=11)
##D dapc.d <- dapc(d, pop=clust.d$grp, n.pca=100, n.da=23)
##D 
##D 
##D ## LOOK AT ONE RESULT
##D dapc.a
##D summary(dapc.a)
##D 
##D ## FORM A LIST OF RESULTS FOR THE 4 DATASETS
##D lres <- list(dapc.a, dapc.b, dapc.c, dapc.d)
##D 
##D 
##D ## DRAW 4 SCATTERPLOTS
##D par(mfrow=c(2,2))
##D lapply(lres, scatter)
##D 
##D 
##D # detach data
##D detach(dapcIllus)
## End(Not run)




