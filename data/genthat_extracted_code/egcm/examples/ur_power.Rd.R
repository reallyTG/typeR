library(egcm)


### Name: ur_power
### Title: Power assessment for unit root tests
### Aliases: ur_power adf_power bvr_power pgff_power ur_power_table
###   adf_power_table bvr_power_table pgff_power_table
### Keywords: ts

### ** Examples

## No test: 
# The following examples may take a long time to run
    
# Compare the power of various unit root tests for specific
# parameter values:
# adf_power(a1=0.9, n=125, p.value=0.1)
# bvr_power(a1=0.9, n=125, p.value=0.1)
# pgff_power(a1=0.9, n=125, p.value=0.1)

# library(tseries)
# ur_power(pp.test, a1=0.9, n=125, p.value=0.1)

# The following illustrates the importance of de-trending
# pgff_power(a1=0.9, n=125, p.value=0.1, trend=10)
# pgff_power(a1=0.9, n=125, p.value=0.1, trend=10, detrend=TRUE)

# Generate tables comparing the powers of various unit root tests:
# adf_power_table()
# bvr_power_table()
# pgff_power_table()
# ur_power_table(pp.test)
## End(No test)


