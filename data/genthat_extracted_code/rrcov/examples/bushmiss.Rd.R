library(rrcov)


### Name: bushmiss
### Title: Campbell Bushfire Data with added missing data items
### Aliases: bushmiss
### Keywords: datasets

### ** Examples

## The following code will result in exactly the same output
##  as the one obtained from the original data set
data(bushmiss)
bf <- bushmiss[bushmiss$MPROB==0,1:5]
plot(bf)
covMcd(bf)


## Not run: 
##D ##  This is the code with which the missing data were created:
##D ##
##D ##  Creates a data set with missing values (for testing purposes)
##D ##  from a complete data set 'x'. The probability of
##D ##  each item being missing is 'pr' (Bernoulli trials).
##D ##
##D getmiss <- function(x, pr=0.1)
##D {
##D     n <- nrow(x)
##D     p <- ncol(x)
##D     done <- FALSE
##D     iter <- 0
##D     while(iter <= 50){
##D         bt <- rbinom(n*p, 1, pr)
##D         btmat <- matrix(bt, nrow=n)
##D         btmiss <- ifelse(btmat==1, NA, 0)
##D         y <- x+btmiss
##D         if(length(which(rowSums(nanmap(y)) == p)) == 0)
##D             return (y)
##D         iter <- iter + 1
##D     }
##D     y
##D }
## End(Not run)




