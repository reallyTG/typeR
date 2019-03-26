library(GSE)


### Name: plot-methods
### Title: Plot methods for objects of class 'CovRobMiss'
### Aliases: plot plot-method plot,CovRobMiss-method
###   plot,CovRobMiss,missing-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(boston)
##D res <- GSE(boston)
##D 
##D ## plot all graphs
##D plot(res)
##D 
##D ## plot individuals plots
##D plot(res, which="qqchisq")
##D plot(res, which="index")
##D plot(res, which="dd")
##D 
##D ## control the coordinates, e.g. log10 transform the y-axis
##D plot(res, which="qqchisq", xlog10=TRUE, ylog10=TRUE)
##D plot(res, which="index", ylog10=TRUE)
##D plot(res, which="dd", xlog10=TRUE, ylog10=TRUE)
## End(Not run)


