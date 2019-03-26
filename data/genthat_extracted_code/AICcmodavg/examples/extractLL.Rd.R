library(AICcmodavg)


### Name: extractLL
### Title: Extract Log-Likelihood of Model
### Aliases: extractLL extractLL.default extractLL.coxph extractLL.coxme
###   extractLL.lmekin extractLL.maxlikeFit extractLL.unmarkedFit
###   extractLL.vglm
### Keywords: models

### ** Examples

##single-season occupancy model example modified from ?occu
## Not run: 
##D require(unmarked)
##D ##single season
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ## add some fake covariates for illustration
##D siteCovs(pferUMF) <- data.frame(sitevar1 = rnorm(numSites(pferUMF)),
##D                                 sitevar2 = rnorm(numSites(pferUMF))) 
##D      
##D ## observation covariates are in site-major, observation-minor order
##D obsCovs(pferUMF) <- data.frame(obsvar1 = rnorm(numSites(pferUMF) *
##D                                  obsNum(pferUMF))) 
##D 
##D ##run model set
##D fm1 <- occu(~ obsvar1 ~ sitevar1, pferUMF)
##D 
##D ##extract log-likelihood
##D extractLL(fm1)
##D detach(package:unmarked)
## End(Not run)



