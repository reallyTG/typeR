library(eesim)


### Name: binary_exposure
### Title: Simulate binary exposure data
### Aliases: binary_exposure

### ** Examples

binary_exposure(n = 5, p = 0.1, trend = "cos1", amp = .02,
                start.date = "2001-02-01")
binary_exposure(n=10, p=.1, cust_expdraw=rnbinom,
                cust_expdraw_args=list(size=10))




