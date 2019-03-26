library(SCGLR)


### Name: scglr
### Title: Function that fits the scglr model
### Aliases: scglr

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
##D genus.scglr <- scglr(formula=form,data = genus,family=fam, K=4,
##D  offset=genus$surface)
##D 
##D summary(genus.scglr)
## End(Not run)



