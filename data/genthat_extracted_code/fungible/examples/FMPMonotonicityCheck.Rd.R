library(fungible)


### Name: FMPMonotonicityCheck
### Title: Utility function for checking FMP monotonicity
### Aliases: FMPMonotonicityCheck
### Keywords: statistics

### ** Examples


## A set of candidate coefficients for an FMP model.
## These coefficients fail the test and thus
## should not be used with genFMPdata to generate
## item response data that are consistent with an 
## FMP model.
 b <- c(1.21, 1.87, -1.02, 0.18, 0.18, 0, 0, 0)
 FMPMonotonicityCheck(b)



