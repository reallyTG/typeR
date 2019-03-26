library(spls)


### Name: cv.sgpls
### Title: Compute and plot the cross-validated error for SGPLS
###   classification
### Aliases: cv.sgpls
### Keywords: models multivariate

### ** Examples

    data(prostate)
    set.seed(1)

    # misclassification rate plot. eta is searched between 0.1 and 0.9 and
    # number of hidden components is searched between 1 and 5
    ## Not run: 
##D         cv <- cv.sgpls(prostate$x, prostate$y, K = c(1:5), eta = seq(0.1,0.9,0.1),
##D             scale.x=FALSE, fold=5)
##D     
## End(Not run)
    
    ## Don't show: 
        cv <- list(); cv$eta.opt <- 0.6; cv$K.opt <- 3; 
    
## End(Don't show)

    (sgpls(prostate$x, prostate$y, eta=cv$eta.opt, K=cv$K.opt, scale.x=FALSE))



