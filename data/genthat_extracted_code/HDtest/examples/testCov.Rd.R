library(HDtest)


### Name: testCov
### Title: Testing the equality of two sample covariance matrices in high
###   dimension.
### Aliases: testCov

### ** Examples

data(GO54)
testCov(GO54$X, GO54$Y, method = "ALL", J = 100)
data(GO26)
testCov(GO26$X, GO26$Y, method = "ALL", J = 100)




