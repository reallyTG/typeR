library(SCGLR)


### Name: scglrCrossVal
### Title: Function that fits and selects the number of component by
###   cross-validation.
### Aliases: scglrCrossVal

### ** Examples

## Not run: 
##D library(SCGLR)
##D 
##D # load sample data
##D data(genus)
##D 
##D # get variable names from dataset
##D n <- names(genus)
##D ny <- n[grep("^gen",n)]    # Y <- names that begins with "gen"
##D nx <- n[-grep("^gen",n)]   # X <- remaining names
##D 
##D # remove "geology" and "surface" from nx
##D # as surface is offset and we want to use geology as additional covariate
##D nx <-nx[!nx%in%c("geology","surface")]
##D 
##D # build multivariate formula
##D # we also add "lat*lon" as computed covariate
##D form <- multivariateFormula(ny,c(nx,"I(lat*lon)"),A=c("geology"))
##D 
##D # define family
##D fam <- rep("poisson",length(ny))
##D 
##D # cross validation
##D genus.cv <- scglrCrossVal(formula=form, data=genus, family=fam, K=12,
##D  offset=genus$surface)
##D 
##D # find best K
##D mean.crit <- colMeans(log(cv))
##D 
##D #plot(mean.crit, type="l")
## End(Not run)



