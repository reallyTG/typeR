library(fdakma)


### Name: kma.compare
### Title: kma.compare runs kma with different numbers of clusters and
###   different warping methods.
### Aliases: kma.compare

### ** Examples

data(kma.data)

x <- kma.data$x # abscissas
y0 <- kma.data$y0 # evaluations of original functions
y1 <- kma.data$y1 # evaluations of original function first derivatives

## Not run: 
##D # Plot of original functions
##D matplot(t(x),t(y0), type='l', xlab='x', ylab='orig.func')
##D title ('Original functions')
##D 
##D # Plot of original function first derivatives
##D matplot(t(x),t(y1), type='l', xlab='x', ylab='orig.deriv')
##D title ('Original function first derivatives')
##D 
##D 
##D # Example: results of kma function with 3 different 
##D # numbers of clusters (1,2,3) combined with four alignment
##D # methods ('NOalignment' by default, 'shift', 'dilation',
##D # 'affine') and considering 'd1.pearson' as similarity.method.
##D kma.compare_example <- kma.compare (
##D   x=x, y0=y0, y1=y1, n.clust = 1:3, 
##D   warping.method = c('affine'), 
##D   similarity.method = 'd1.pearson',
##D   center.method = 'k-means', 
##D   seeds = c(1,21,30),
##D   plot.graph=1)
##D 
##D names (kma.compare_example)
##D 
##D # To see results for kma function with n.clust=2 
##D # and warping.method='affine'.
##D kma.show.results (kma.compare_example$Result.affine[[2]])
##D 
##D 
##D # Labels assigned to each function for the 
##D # kma function with n.clust=2 and warping.method='affine'.
##D kma.compare_example$Result.affine[[2]]$labels
## End(Not run)




