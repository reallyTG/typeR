library(egcm)


### Name: bvr.test
### Title: Unit root test based upon Breitung's variance ratio
### Aliases: bvr.test bvr_rho
### Keywords: ts

### ** Examples

# The following should produce a low p-value
bvr_rho(rnorm(100))
bvr.test(rnorm(100))

# The following should produce a high p-value
bvr_rho(cumsum(rnorm(100)))
bvr.test(cumsum(rnorm(100)))

# Test with an autoregressive sequence where rho = 0.8
bvr.test(rar1(100, a1=0.8))

# If there is a linear trend, bvr.test with detrend=FALSE
# is likely to find a unit root when there is none:
bvr.test(1:100 + rnorm(100))
bvr.test(1:100 + rnorm(100), detrend=TRUE)

# Display the power of the test for various values of rho and n:
bvr_power(a1=0.8, n=100, nrep=100)
bvr_power(a1=0.9, n=250, nrep=100)
bvr_power(a1=0.95, n=250, nrep=100)

# This is to be compared to the power of the adf.test at this level:
adf_power(a1=0.8, n=100, nrep=100)
adf_power(a1=0.9, n=250, nrep=100)
adf_power(a1=0.95, n=250, nrep=100)



