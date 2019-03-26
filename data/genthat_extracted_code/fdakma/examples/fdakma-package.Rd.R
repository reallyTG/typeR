library(fdakma)


### Name: fdakma-package
### Title: Functional Data Analysis: K-Mean Alignment
### Aliases: fdakma-package fdakma
### Keywords: Functional Data Analysis Alignment Registration K-Mean
###   Clustering Time Warping

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
##D # Example: result of kma function with 2 clusters, 
##D # allowing affine transformation for the abscissas
##D # and considering 'd1.pearson' as similarity.method.
##D fdakma_example <- kma (
##D   x=x, y0=y0, y1=y1, n.clust = 2, 
##D   warping.method = 'affine', 
##D   similarity.method = 'd1.pearson',
##D   center.method = 'k-means', 
##D   seeds = c(1,21)
##D )
##D 
##D kma.show.results(fdakma_example)
##D 
##D names(fdakma_example)
##D 
##D # Labels assigned to each function
##D fdakma_example$labels
##D 
##D # Total shifts and dilations applied to the original 
##D # abscissa to obtain the aligned abscissa
##D fdakma_example$shift
##D fdakma_example$dilation
## End(Not run)




