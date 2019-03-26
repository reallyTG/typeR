library(SCGLR)


### Name: scglrTheme
### Title: Function that fits the theme model
### Aliases: scglrTheme

### ** Examples

## Not run: 
##D library(SCGLR)
##D 
##D # load sample data
##D data(genus)
##D 
##D # get variable names from dataset
##D n <- names(genus)
##D n <-n[!n%in%c("geology","surface","lon","lat","forest","altitude")]
##D ny <- n[grep("^gen",n)]    # Y <- names that begins with "gen"
##D nx1 <- n[grep("^evi",n)]   # X <- remaining names
##D nx2 <- n[-c(grep("^evi",n),grep("^gen",n))]
##D 
##D 
##D form <- multivariateFormula(ny,nx1,nx2,A=c("geology"))
##D fam <- rep("poisson",length(ny))
##D testthm <-scglrTheme(form,data=genus,H=c(2,2),family=fam,offset = genus$surface)
##D plot(testthm)
## End(Not run)



