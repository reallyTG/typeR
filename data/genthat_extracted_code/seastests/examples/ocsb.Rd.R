library(seastests)


### Name: ocsb
### Title: OCSB test
### Aliases: ocsb

### ** Examples

teststat <- ocsb(ts(rnorm(70, 10,10), frequency=7), nrun=200)
check_residuals(teststat)



