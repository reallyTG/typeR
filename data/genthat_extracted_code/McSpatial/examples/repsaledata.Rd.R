library(McSpatial)


### Name: repsaledata
### Title: Preparation of a Repeat Sales Data Set
### Aliases: repsaledata
### Keywords: Repeat Sales

### ** Examples

id <-      c(1,1,1, 2,2,2, 3,3,3, 4,4,4, 5,5,5)
timevar <- c(1,2,3, 1,2,2, 3,1,1, 1,1,2, 2,2,3)
price <- seq(1:15)
basedata <- data.frame(id,timevar,price)
basedata

rdata <- repsaledata(price,timevar,id)
rdata




