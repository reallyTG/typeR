library(phenology)


### Name: IPModel
### Title: Estimates the pattern of internesting intervals for a set of
###   parameters.
### Aliases: IPModel

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D par <- c(meanIP = 9.8, 
##D sdIP = 0.1, 
##D minIP = 7, 
##D 
##D pAbort = -logit(0.1), 
##D meanAbort = 2, 
##D sdAbort = 0.05, 
##D 
##D pCapture = -logit(0.8), 
##D 
##D meanECF = 4, 
##D sdECF = 0.1)
##D 
##D model <- IPModel(c(par, N=10000))
##D 
##D plot(model)
##D 
## End(Not run)



