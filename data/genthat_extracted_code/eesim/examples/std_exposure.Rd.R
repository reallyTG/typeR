library(eesim)


### Name: std_exposure
### Title: Simulate exposure data using default methods
### Aliases: std_exposure

### ** Examples

std_exposure(n = 5, central = .1, trend = "cos1", amp = .02)
std_exposure(n = 5, central = 50, sd = 5, trend = "cos3", amp = .6,
             exposure_type = "continuous", start.date = "2001-04-01")
std_exposure(n=50, central=.1, amp=.05,cust_expdraw=rnbinom,
             cust_expdraw_args=list(size=10))




