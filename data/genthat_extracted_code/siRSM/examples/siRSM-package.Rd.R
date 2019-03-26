library(siRSM)


### Name: siRSM-package
### Title: siRSM: Single-index Response Surface Models
### Aliases: siRSM-package
### Keywords: single index models response surface models parallel
###   computing

### ** Examples

## Not run: 
##D # load illustrative data set provided within the package
##D data(EdwardsMBA)
##D 
##D # parse the variables
##D y=EdwardsMBA[,'AVGSAT4']
##D U=EdwardsMBA[,c('PCPRE','DMPRE','EIPRE','MRPRE')]
##D V=EdwardsMBA[,c('PCACT','DMACT','EIACT','MRACT')]
##D 
##D # fit the model
##D m1=siRSM(y,U,V)
##D 
##D # look at the model
##D m1
##D plot(m1)
##D 
##D # F-test of surface curvature
##D surface.test(m1)
##D 
##D # inference on the index (using just 10 bootstrap samples here)
##D ci.index(y,U,V,B=10)
##D 
##D # obtain statistics of the response surface (conditional on the estimated index)
##D surface.stats(m1)
##D 
##D # inference for these surface statistics (again, conditional on the estimated index)
##D ci.surface(m1)
##D 
##D # fit an interaction-only model
##D m2=siRSM(y,U,V,interaction.only=TRUE)
##D plot(m2)
## End(Not run)



