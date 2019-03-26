library(randomLCA)


### Name: dentistry
### Title: Dental X-ray data
### Aliases: dentistry
### Keywords: datasets

### ** Examples

## Not run: 
##D # fit LCR model from Qu et al (1996)
##D dentistry.lca <- randomLCA(dentistry[,1:5],freq=dentistry$freq)
##D # start with constant laoding
##D dentistry.lcarandom <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
##D 	random=TRUE,probit=TRUE)
##D # allow loading to vary by dentist
##D dentistry.lcarandomunequal <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
##D 	random=TRUE,constload=FALSE,probit=TRUE)
## End(Not run)



