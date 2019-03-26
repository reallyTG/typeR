library(seastests)


### Name: check_residuals
### Title: Check model used in OCSB test
### Aliases: check_residuals

### ** Examples

teststat <- ocsb(ts(rnorm(100, 10,10), frequency=12), nrun=100)
check_residuals(teststat)



