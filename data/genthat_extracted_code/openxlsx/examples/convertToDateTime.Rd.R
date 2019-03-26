library(openxlsx)


### Name: convertToDateTime
### Title: Convert from excel time number to R POSIXct type.
### Aliases: convertToDateTime

### ** Examples

## 2014-07-01, 2014-06-30, 2014-06-29
x <- c(41821.8127314815, 41820.8127314815, NA, 41819, NaN) 
convertToDateTime(x)
convertToDateTime(x, tx = "Australia/Perth")



