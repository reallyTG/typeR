library(goft)


### Name: gp_fit
### Title: Fitting the generalized Pareto distribution to data
### Aliases: gp_fit
### Keywords: htest

### ** Examples

# Example 1: fitting a gPd to the excesses above the threshold 0.165 ppm of the ozone
# levels provided in the o3 data set.
data(o3)
o3levels <- o3$ozone_level - 0.165      # ozone levels minus the threshold 0.165 ppm 
gp_fit(o3levels, method = "combined")   # fitting the gPd using the "combined" method 

# Example 2: fitting a gPd to a simulated data set from the uniform distribution,
# which is a gPd with shape parameter = -1 and scale parameter = 1.
x <-  runif(100)       # simulating a uniform random sample 
gp_fit(x, "combined")  # fitting a gPd to  x  using the "combined" method



