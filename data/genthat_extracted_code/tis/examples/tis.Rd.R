library(tis)


### Name: tis
### Title: Time Indexed Series
### Aliases: tis as.tis as.tis.tis as.tis.ts as.tis.zoo as.tis.default
###   is.tis
### Keywords: ts

### ** Examples

tis(1:48, start = c(2000, 1), freq = 12)
tis(1:48, start = ti(20000101, tif = "monthly"))    ## same result
tis(0, start = c(2000,1), end = c(2000,52), tif = "weekly")



