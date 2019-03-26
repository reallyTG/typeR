library(xts)


### Name: make.index.unique
### Title: Force Time Values To Be Unique
### Aliases: make.index.unique make.time.unique is.index.unique
###   is.time.unique
### Keywords: ts

### ** Examples


ds <- options(digits.secs=6) # so we can see the change

x <- xts(1:10, as.POSIXct("2011-01-21") + c(1,1,1,2:8)/1e3)
x
make.index.unique(x)

options(ds)



