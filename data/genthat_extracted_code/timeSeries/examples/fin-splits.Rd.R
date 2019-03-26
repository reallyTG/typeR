library(timeSeries)


### Name: splits
### Title: splits
### Aliases: splits

### ** Examples

## Create a Return Series with a Split - 
   data <- runif(12, -1, 1)
   data[6] <- 20
   x <- timeSeries(data, timeCalendar(), units="RUNIF")
   x
   
## Search for the Split:
   splits(x, sd=3, complement=TRUE)
   splits(x, sd=3, complement=FALSE)



