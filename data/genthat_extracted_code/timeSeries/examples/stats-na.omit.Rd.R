library(timeSeries)


### Name: na
### Title: Handling Missing Time Series Values
### Aliases: na na.omit na.omit,timeSeries-method na.omit.timeSeries
###   removeNA substituteNA interpNA
### Keywords: math

### ** Examples

## Create a Matrix -
   X <- matrix(rnorm(100), ncol = 5)
   
## Replace a Single NA Inside - 
   X[3, 5] <- NA
   
## Replace Three in a Row Inside - 
   X[17, 2:4] <- c(NA, NA, NA)
   
## Replace Three in a Column Inside - 
   X[13:15, 4] <- c(NA, NA, NA)
   
## Replace Two at the Right Border - 
   X[11:12, 5] <- c(NA, NA)
   
## Replace One in the Lower Left Corner - 
   X[20, 1] <- NA
   print(X)
     
## Remove Rows with NAs - 
   removeNA(X)
   
## Subsitute NA's by Zeros or Column Means - 
   substituteNA(X, type = "zeros")
   substituteNA(X, type = "mean")
   
## Interpolate NA's Linearily - 
   interpNA(X, method = "linear")
   # Note the corner missing value cannot be interpolated!
   
## Take Previous Values in a Column - 
   interpNA(X, method = "before")
   # Also here, the corner value is excluded



