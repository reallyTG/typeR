library(eesim)


### Name: continuous_exposure
### Title: Simulate continuous exposure data
### Aliases: continuous_exposure

### ** Examples

continuous_exposure(n = 5, mu = 100, sd = 10, trend = "cos1")
continuous_exposure(n=10, mu=3, trend="linear", slope = 2,
                    cust_expdraw=rnorm, cust_expdraw_args = list(sd=.5))




