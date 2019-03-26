library(CircMLE)


### Name: check_data
### Title: Data Checking Function
### Aliases: check_data
### Keywords: checking data

### ** Examples

testdata = circular::rvonmises(100, mu = circular::circular(pi), kappa = 3,
   control.circular = list(units = "degrees"))
check_data(testdata)



