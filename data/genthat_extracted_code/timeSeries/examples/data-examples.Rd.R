library(timeSeries)


### Name: TimeSeriesData
### Title: Time Series Data Sets
### Aliases: TimeSeriesData LPP2005REC MSFT USDCHF
### Keywords: datasets

### ** Examples

## Plot LPP2005 Example Data Set -  
   data(LPP2005REC)
   plot(LPP2005REC, type = "l")
   
## Plot MSFT Example Data Set - 
   data(MSFT)
   plot(MSFT[, 1:4], type = "l")
   plot(MSFT[, 5], type = "h")
   
## Plot USDCHF Example Data Set - 
   # plot(USDCHF)



