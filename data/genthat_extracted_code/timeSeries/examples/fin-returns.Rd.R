library(timeSeries)


### Name: returns
### Title: Financial Returns
### Aliases: returns returns,ANY-method returns,timeSeries-method returns0
###   returnSeries getReturns
### Keywords: chron

### ** Examples

## Load Microsoft Data - 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   X = MSFT[1:10, 1:4]
   X

## Continuous Returns - 
   returns(X)
   returns0(X)
  
## Discrete Returns:
   returns(X, method = "discrete")
   
## Don't trim:
   returns(X, trim = FALSE)
   
## Use Percentage Values:
   returns(X, percentage = TRUE, trim = FALSE)



