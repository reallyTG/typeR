library(timeSeries)


### Name: model.frame
### Title: Model Frames for Time Series Objects
### Aliases: model.frame model.frame.default,ANY,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data -
   setRmetricsOptions(myFinCenter = "GMT")
   X <- MSFT[1:12, ]

## Extract High's and Low's:
   DATA <- model.frame( ~ High + Low, data = X)
   class(DATA)
   as.timeSeries(DATA)
   
## Extract Open Prices and their log10's:
   base <- 10
   Open <- model.frame(Open ~ log(Open, base = `base`), data = X)
   colnames(Open) <- c("X", "log10(X)")
   class(Open)
   as.timeSeries(Open)



