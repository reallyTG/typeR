library(phenology)


### Name: IPPredict
### Title: Predict the possible clutch number based on observed
###   Internesting Period.
### Aliases: IPPredict

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D ######### Fit using Maximum-Likelihood
##D 
##D par <- c(meanIP = 9.9959691992722917, 
##D          sdIP = 0.10066664270893474, 
##D          minIP = 7.5684588178888754, 
##D          pAbort = 2.2510012544630911, 
##D          meanAbort = 2.8969185085603386, 
##D          sdAbort = 0.92688983853803242, 
##D          pCapture = -1.0393803705929086, 
##D          meanECF = 3.9551519427394255, 
##D          sdECF = 0.31657679943365019)
##D 
##D IPPredict(par=par, IP=c(10, 80))
##D 
## End(Not run)



