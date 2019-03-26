library(eva)


### Name: fortmax
### Title: Top Ten Annual Precipitation: Fort Collins, Colorado
### Aliases: fortmax
### Keywords: datasets

### ** Examples

data(fortmax)
y <- fortmax[, -1]
gevrSeqTests(y, method = "ed")



