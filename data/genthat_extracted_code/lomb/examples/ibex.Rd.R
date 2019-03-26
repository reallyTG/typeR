library(lomb)


### Name: ibex
### Title: Rumen Temperature In An Alpine Ibex
### Aliases: ibex
### Keywords: datasets

### ** Examples

data(ibex)
datetime <- as.POSIXlt(ibex$date)
plot(datetime,ibex$temp,pch=19,cex=0.3)



