library(ARCensReg)


### Name: CloudCeiling
### Title: Cloud Ceiling Height
### Aliases: CloudCeiling
### Keywords: datasets

### ** Examples

## Not run: 
##D data(CloudCeiling)
##D 
##D plot.ts(CloudCeiling$y)
##D 
##D #Proportion of censoring
##D prop.table(table(CloudCeiling$cc))
##D 
##D #A censored regression model
##D ##this may take a long time due to the number of censored observations.
##D ##For other examples see help(ARCensReg).
##D 
##D x = as.matrix(rep(1,length(CloudCeiling$y)))
##D miss =  which(is.na(CloudCeiling$y))
##D AR_reg = ARCensReg(CloudCeiling$cc,CloudCeiling$y,x,cens='right',miss=miss,p=1,tol=.001)
## End(Not run)



