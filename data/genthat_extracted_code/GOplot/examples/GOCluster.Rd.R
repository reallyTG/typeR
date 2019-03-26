library(GOplot)


### Name: GOCluster
### Title: Circular dendrogram.
### Aliases: GOCluster

### ** Examples

## Not run: 
##D #Load the included dataset
##D data(EC)
##D 
##D #Generating the circ object
##D circ<-circular_dat(EC$david, EC$genelist)
##D 
##D #Creating the cluster plot
##D GOCluster(circ, EC$process)
##D 
##D #Cluster the data according to gene expression and assigning a different color scale for the logFC
##D GOCluster(circ,EC$process,clust.by='logFC',lfc.col=c('darkgoldenrod1','black','cyan1'))
## End(Not run)



