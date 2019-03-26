library(timeSeries)


### Name: attach
### Title: Attach a timSeries to the search path
### Aliases: attach attach,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data Set - 
   x <- MSFT[1:10, ]
   colnames(x)
   
## Attach the Series and Compute the Range - 
   attach(x)
   range <- High - Low
   range
   
## Convert Vector to a timeSeries Object -
   timeSeries(data=range, charvec=time(x), units="Range")
   
## Detach the series from the search path -
   detach("x")
   ans <- try(High, silent=TRUE)
   cat(ans[1])



