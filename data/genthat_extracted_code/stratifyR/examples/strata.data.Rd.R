library(stratifyR)


### Name: strata.data
### Title: Stratification of Univariate Survey Population Using the Data
### Aliases: strata.data

### ** Examples

## Not run: 
##D data(anaemia)
##D Iron <- anaemia$Iron
##D strata.data(Iron, h = 2, n=350)
##D #--------------------------------------------------------
##D data(SHS) #Household Spending data from stratification package
##D weight <- SHS$WEIGHT
##D hist(weight)
##D length(weight)
##D strata.data(weight, h = 2, n=500)
##D #------------------------------------------
##D data(sugarcane)
##D Production <- sugarcane$Production
##D hist(Production)
##D strata.data(Production, h = 2, n=1000)
##D #------------------------------------------
## End(Not run)




