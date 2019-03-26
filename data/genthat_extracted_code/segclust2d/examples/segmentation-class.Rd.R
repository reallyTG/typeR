library(segclust2d)


### Name: segmentation-class
### Title: segmentation class description
### Aliases: segmentation-class print.segmentation plot.segmentation
###   likelihood.segmentation plot_likelihood get_likelihood
###   logLik.segmentation plot_BIC BIC.segmentation stateplot states
###   segment augment.segmentation segmap

### ** Examples

## Not run: 
##D plot(res.segclust)
##D plot(res.segclust, nseg = 10, ncluster = 3)
## End(Not run)
## Not run: 
##D plot_likelihood(res.seg)
## End(Not run)
## Not run: 
##D logLik(res.seg)
## End(Not run)

## Not run: 
##D plot_BIC(res.segclust)
## End(Not run)

## Not run: 
##D plot_BIC(res.segclust)
## End(Not run)

## Not run: 
##D stateplot(res.segclust)
##D stateplot(res.seg)
## End(Not run)
## Not run: 
##D states(res.segclust)
##D states(res.seg)
## End(Not run)
## Not run: 
##D segment(res.segclust)
##D segment(res.segclust, ncluster = 3, nseg = 30)
##D segment(res.seg)
##D segment(res.seg, nseg = 4)
## End(Not run)
## Not run: 
##D augment(res.segclust)
##D augment(res.segclust, ncluster = 3, nseg = 30)
##D augment(res.seg)
##D augment(res.seg, nseg = 4)
## End(Not run)
## Not run: 
##D segmap(res.segclust, coord.names = c("x","y"))
##D segmap(res.segclust, ncluster = 3, nseg = 30)
##D segmap(res.seg)
##D segmap(res.seg, nseg = 4)
## End(Not run)



