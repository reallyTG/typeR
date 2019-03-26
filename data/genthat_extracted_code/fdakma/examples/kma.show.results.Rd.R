library(fdakma)


### Name: kma.show.results
### Title: Auxiliary function plotting results of kma function.
### Aliases: kma.show.results

### ** Examples

data(kma.data)

x <- kma.data$x # abscissas
y0 <- kma.data$y0 # evaluations of original functions
y1 <- kma.data$y1 # evaluations of original function first derivatives

## Not run: 
##D # kma function with 2 clusters, allowing affine 
##D # transformation for the abscissas and considering 
##D # 'd1.pearson' as similarity.method.
##D kma.show.results_example1 <- kma (
##D   x=x, y0=y0, y1=y1, n.clust = 2, 
##D   warping.method = 'affine', 
##D   similarity.method = 'd1.pearson',
##D   center.method = 'k-means', 
##D   seeds = c(1,21)
##D )
##D 
##D # Example: kma.show.results shows the results of kma function
##D kma.show.results(kma.show.results_example1)
##D 
##D 
##D # Example using outputs of kma.compare function
##D 
##D # Results of kma function with 3 different 
##D # numbers of clusters (1,2,3) combined with four alignment
##D # methods ('NOalignment' by default, 'shift', 'dilation',
##D # 'affine') and considering 'd1.pearson' as similarity.method.
##D kma.show.results_example2 <- kma.compare (
##D   x=x, y0=y0, y1=y1, n.clust = 1:3, 
##D   warping.method = c('affine'), 
##D   similarity.method = 'd1.pearson',
##D   center.method = 'k-means', 
##D   seeds = c(1,21,30),
##D   plot.graph=1)
##D 
##D names (kma.show.results_example2)
##D 
##D # To see results for kma function with n.clust=2 
##D # and warping.method='affine'.
##D kma.show.results (kma.show.results_example2$Result.affine[[2]])
##D 
##D # Labels assigned to each function for the 
##D # kma function with n.clust=2 and warping.method='affine'.
##D kma.show.results_example2$Result.affine[[2]]$labels
## End(Not run)





