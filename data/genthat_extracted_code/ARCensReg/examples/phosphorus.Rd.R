library(ARCensReg)


### Name: phosphorus
### Title: Phosphorus Concentration data
### Aliases: phosphorus
### Keywords: datasets

### ** Examples

## Not run: 
##D data(phosphorus)
##D 
##D plot.ts(phosphorus$lP)
##D lines(phosphorus$lcl,col=2,lty=2)
##D 
##D #Proportion of censoring
##D prop.table(table(phosphorus$cc))
##D 
##D #A censored regression model
##D x = cbind(1,phosphorus$lQ)
##D miss =  which(is.na(phosphorus$lP))
##D AR_reg = ARCensReg(phosphorus$cc,phosphorus$lP,x,cens='left',miss=miss,p=1,tol=.001)
## End(Not run)



