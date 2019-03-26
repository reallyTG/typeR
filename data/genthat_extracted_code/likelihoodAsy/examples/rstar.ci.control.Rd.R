library(likelihoodAsy)


### Name: rstar.ci.control
### Title: Auxiliary function for controlling computation of r*-based
###   confidence intervals
### Aliases: rstar.ci.control
### Keywords: htest

### ** Examples

# A variation on example(rstar.ci):
## Not run: 
##D obj <- rstar.ci(quinedata, thetainit=c(coef(quine.nb1),quine.nb1$theta),  floglik=logLikNbin, 
##D                 datagen=genDataNbin, fscore=gradLikNbin, fpsi=function(theta) theta[2], R=1000, 
##D                 psidesc="Coefficient of EthN", npoints=5, away=0.1)
##D plot(obj)
## End(Not run)



