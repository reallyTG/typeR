library(HDtest)


### Name: testMean
### Title: Testing the equality of two sample mean vectors in high
###   dimension.
### Aliases: testMean

### ** Examples

data(GO54)
testMean(GO54$X, m = 100, method = "HD")
testMean(GO54$X, GO54$Y, m = 100, method = "ALL")




