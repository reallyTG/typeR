library(timeSeries)


### Name: cumulated
### Title: Cumulated Time Series from Returns
### Aliases: cumulated cumulated.default
### Keywords: chron

### ** Examples

## Use the Microsofts' Close Prices Indexed to 1 - 
   MSFT.CL <- MSFT[, "Close"]
   MSFT.CL <- MSFT.CL/MSFT[[1, "Close"]]
   head(MSFT.CL)

## Compute Discrete Return -    
   MSFT.RET <- returns(MSFT.CL, method = "discrete")
   
## Cumulated Series and Compare - 
   MSFT.CUM <- cumulated(MSFT.RET, method = "discrete") 
   head(cbind(MSFT.CL, MSFT.CUM))



