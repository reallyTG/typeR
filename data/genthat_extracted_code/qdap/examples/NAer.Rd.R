library(qdap)


### Name: NAer
### Title: Replace Missing Values (NA)
### Aliases: NAer
### Keywords: missing-value

### ** Examples

## Not run: 
##D set.seed(10)              
##D (x <- sample(c(rep(NA, 4), 1:10), 20, rep=T))
##D NAer(x)
##D 
##D set.seed(10)
##D (y <- data.frame(matrix(x, 5, 4))                           )
##D NAer(y)
##D NAer(y, "MISSING")  
## End(Not run)



