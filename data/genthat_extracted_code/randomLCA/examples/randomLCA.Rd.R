library(randomLCA)


### Name: randomLCA
### Title: Fits a Latent Class Model including a Random Effect
### Aliases: randomLCA
### Keywords: multivariate

### ** Examples

## Not run: 
##D # standard latent class with 2 classes
##D dentistry.lca2 <- randomLCA(dentistry[,1:5],freq=dentistry$freq,nclass=2)
##D # random effects model with constant random effect loading
##D dentistry.lca2random <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
##D 	nclass=2,random=TRUE,constload=TRUE,probit=TRUE)
##D # allow loading to vary by dentist
##D # this is the 2LCR model from Qu et al (1996)
##D dentistry.lca2random1 <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
##D 	nclass=2,random=TRUE,constload=FALSE,probit=TRUE)
## End(Not run)



