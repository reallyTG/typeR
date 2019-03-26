library(spls)


### Name: cv.spls
### Title: Compute and plot cross-validated mean squared prediction error
###   for SPLS regression
### Aliases: cv.spls
### Keywords: regression multivariate

### ** Examples

    data(yeast)
    set.seed(1)

    # MSPE plot. eta is searched between 0.1 and 0.9 and
    # number of hidden components is searched between 1 and 10

    ## Not run: 
##D         cv <- cv.spls(yeast$x, yeast$y, K = c(1:10), eta = seq(0.1,0.9,0.1))
##D         
##D         # Optimal eta and K
##D         cv$eta.opt
##D         cv$K.opt
##D         (spls(yeast$x, yeast$y, eta=cv$eta.opt, K=cv$K.opt))
##D     
## End(Not run)



