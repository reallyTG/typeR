library(berryFunctions)


### Name: around
### Title: View values around an index
### Aliases: around

### ** Examples

## Not run: 
##D  ## View should not be used in examples
##D myDF <- data.frame(A=1:30, B=cumsum(rnorm(30)))
##D myDF[c(5,7,23,29),1] <- NA
##D around(myDF, i=is.na(myDF$A))
##D around(myDF, i=c(11,19), n2=0)
## End(Not run)




