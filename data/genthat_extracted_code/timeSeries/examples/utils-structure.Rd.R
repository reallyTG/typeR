library(timeSeries)


### Name: str-methods
### Title: timeSeries Object Structure
### Aliases: str str,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data Set -
   data(MSFT)
   X <- MSFT[1:12, 1:4]
   colnames(X) <- abbreviate(colnames(X), 4)
    
## Display Structure - 
   str(X)



