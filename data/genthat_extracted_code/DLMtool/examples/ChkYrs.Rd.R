library(DLMtool)


### Name: ChkYrs
### Title: Check the years to summarize performance
### Aliases: ChkYrs
### Keywords: internal

### ** Examples

## Not run: 
##D MSE <- runMSE()
##D ChkYrs(NULL, MSE) # returns c(1, MSE@proyears)
##D ChkYrs(c(2,5), MSE) # returns c(2,5)
##D ChkYrs(c(70,80), MSE) # returns c(MSE@proyears-10,MSE@proyears)
##D ChkYrs(5, MSE) # returns c(1,5)
##D ChkYrs(-5, MSE) # returns c(46,50)
## End(Not run)




