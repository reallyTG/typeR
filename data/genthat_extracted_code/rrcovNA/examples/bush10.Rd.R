library(rrcovNA)


### Name: bush10
### Title: Campbell Bushfire Data with added missing data items (10
###   percent)
### Aliases: bush10
### Keywords: datasets

### ** Examples

## The following code will result in exactly the same output
##  as the one obtained from the original data set
data(bush10)
plot(bush10)
CovNAMcd(bush10)


## Not run: 
##D ##  This is the code with which the missing data were created:
##D ##  Creates a data set with missing values (for testing purposes)
##D ##  from a complete data set 'x'. The probability of
##D ##  each item being missing is 'pr'.
##D ##
##D getmiss <- function(x, pr=0.1){
##D     library(Rlab)
##D     n <- nrow(x)
##D     p <- ncol(x)
##D     bt <- rbern(n*p, pr)
##D     btmat <- matrix(bt, nrow=n)
##D     btmiss <- ifelse(btmat==1, NA, 0)
##D     x+btmiss
##D }
## End(Not run)




