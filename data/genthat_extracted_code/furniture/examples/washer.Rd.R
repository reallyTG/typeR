library(furniture)


### Name: washer
### Title: Wash Your Data
### Aliases: washer

### ** Examples

x = c(1:20, NA, NaN)
washer(x, 9, 10)
washer(x, 9, 10, value=0)
washer(x, 1:10)
washer(x, is.na, is.nan, value=0)
washer(x, is.na, is.nan, 1:3, value=0)




