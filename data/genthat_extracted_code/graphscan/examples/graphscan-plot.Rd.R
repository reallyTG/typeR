library(graphscan)


### Name: graphscan_plot
### Title: Plot clusters localisations or the 1D events distributions.
### Aliases: graphscan_plot graphscan_plot,graphscan-method
### Keywords: spatial cluster DNA mutation

### ** Examples

## Not run: 
##D # 1D example:
##D require(ape)
##D data(woodmouse)
##D g1<-graphscan_1d(data=woodmouse)
##D g1<-cluster(g1)
##D graphscan_plot(g1,events_series=3)
##D dev.new()
##D graphscan_plot(g1,events_series="all")
##D 
##D # 2D example:
##D data(france_two_clusters)
##D g2<-graphscan_nd(data=france_two_clusters)
##D g2<-cluster(g2)
##D graphscan_plot(g2,map=france)
##D 
##D # 3D example:
##D data(sample3d)
##D g3<-graphscan_nd(data=sample3d)
##D g3<-cluster(g3)
##D graphscan_plot(g3,projection=TRUE) # 2D plot
##D graphscan_plot(g3) # 3D plot
## End(Not run)



