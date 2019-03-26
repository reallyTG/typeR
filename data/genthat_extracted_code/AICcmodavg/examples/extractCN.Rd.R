library(AICcmodavg)


### Name: extractCN
### Title: Compute Condition Number
### Aliases: extractCN extractCN.default extractCN.unmarkedFit
###   print.extractCN
### Keywords: models

### ** Examples

##N-mixture model example modified from ?pcount
## Not run: 
##D require(unmarked)
##D ##single season
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D ##run model
##D fm.mallard <- pcount(~ ivel+ date + I(date^2) ~ length + elev + forest,
##D                      mallardUMF, K=30)
##D 
##D ##compute condition number
##D extractCN(fm.mallard)
##D 
##D ##compare against 'kappa'
##D kappa(fm.mallard@opt$hessian, exact = TRUE)
##D detach(package:unmarked)
## End(Not run)



