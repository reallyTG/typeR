library(SPOT)


### Name: repairNonNumeric
### Title: Repair Non-numeric Values
### Aliases: repairNonNumeric
### Keywords: internal

### ** Examples

x <- matrix(10*runif(12),4,3)
types <- c("numeric","factor","factor")
repairNonNumeric(x,types)



