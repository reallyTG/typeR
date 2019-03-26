library(PVAClone)


### Name: Internals
### Title: Internal functions
### Aliases: Internals internals PVAClone-internals internal-functions
###   ts_index
### Keywords: utils manip

### ** Examples

## ts_index
x <- 1:20
x[c(3,4, 6, 10, 13:15, 20)] <- NA
ts_index(x, "density")
ts_index(x, "expectation")



