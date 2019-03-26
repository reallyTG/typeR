library(zoo)


### Name: coredata
### Title: Extracting/Replacing the Core Data of Objects
### Aliases: coredata coredata.default coredata.zoo coredata.ts
###   coredata.its coredata.irts coredata<- coredata<-.zoo coredata<-.ts
###   coredata<-.irts coredata<-.its
### Keywords: ts

### ** Examples

x.date <- as.Date(paste(2003, rep(1:4, 4:1), seq(1,20,2), sep = "-"))
x <- zoo(matrix(rnorm(20), ncol = 2), x.date)

## the full time series
x
## and only matrix of observations
coredata(x)

## change the observations
coredata(x) <- matrix(1:20, ncol = 2)
x



