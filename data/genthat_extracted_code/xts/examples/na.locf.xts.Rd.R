library(xts)


### Name: na.locf.xts
### Title: Last Observation Carried Forward
### Aliases: na.locf.xts
### Keywords: misc

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
x[c(1,2,5,9,10)] <- NA

x
na.locf(x)
na.locf(x, fromLast=TRUE)
na.locf(x, na.rm=TRUE, fromLast=TRUE)



