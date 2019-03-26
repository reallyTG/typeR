library(timeSeries)


### Name: diff
### Title: diff
### Aliases: diff diff,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data Set -
   x <- MSFT[1:12, ]
   x

## Compute Differences -
   diff(x)   
   
## Trimmed Differences -
   diff(x, trim=TRUE) 

## Padded Differences -
   diff(x, trim=FALSE, pad=0) 



