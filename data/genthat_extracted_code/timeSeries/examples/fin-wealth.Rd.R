library(timeSeries)


### Name: wealth
### Title: Conversion of an index to wealth
### Aliases: index2wealth
### Keywords: chron

### ** Examples

## Load MSFT Open Prices  - 
   INDEX <- MSFT[1:20, 1]
   INDEX
   
## Compute Wealth Normalized to 100 - 
   100 * index2wealth(INDEX)



