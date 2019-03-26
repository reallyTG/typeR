library(cem)


### Name: imbalance
### Title: Calculates several imbalance measures
### Aliases: imbalance
### Keywords: datagen

### ** Examples
 
## Not run: 
##D 
##D data(LL)
##D 
##D todrop <- c("treated","re78")
##D    
##D imbalance(LL$treated, LL, drop=todrop)
##D 
##D # cem match: automatic bin choice
##D mat <- cem(treatment="treated", data=LL, drop="re78")
## End(Not run)



