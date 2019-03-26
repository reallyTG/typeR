library(nFactors)


### Name: nFactorsObjectMethods
### Title: Utility Functions for nFactors Class Objects
### Aliases: is.nFactors print.nFactors summary.nFactors
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE
 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues
 N        <- dFactors$Raiche$nsubjects

 res <- nBartlett(eig,N); res; is.nFactors(res); summary(res, digits=2)
 res <- nBentler(eig,N);  res; is.nFactors(res); summary(res, digits=2)
 res <- nCng(eig);        res; is.nFactors(res); summary(res, digits=2)
 res <- nMreg(eig);       res; is.nFactors(res); summary(res, digits=2)
 res <- nSeScree(eig);    res; is.nFactors(res); summary(res, digits=2)
 
## SIMILAR RESULTS, BUT NOT A nFactors OBJECT
 res <- nScree(eig);      res; is.nFactors(res); summary(res, digits=2)
 


