library(lqr)


### Name: best.lqr
### Title: Best Fit in Robust Linear Quantile Regression
### Aliases: best.lqr
### Keywords: package quantile regression skew

### ** Examples

## Not run: 
##D data(crabs,package = "MASS")
##D 
##D crabs$sex <- as.character(crabs$sex)
##D crabs$sex[crabs$sex=="M"]=0
##D crabs$sex[crabs$sex=="F"]=1
##D crabs$sex = as.numeric(crabs$sex)
##D 
##D attach(crabs)
##D 
##D ##Setting
##D y  <- BD
##D x  <- cbind(1,FL,sex)
##D 
##D #Finding the best model for the 3rd quartile based on Akaike criterion
##D res = best.lqr(y, x, p = 0.75, criterion = "AIC")
##D  
## End(Not run)



