library(AHMbook)


### Name: issj.sim
### Title: Simulate open distance sampling data for the Island Scrub Jays
### Aliases: issj.sim

### ** Examples

# A toy example with just 20 sites
set.seed(2015)
tmp <- issj.sim(B = 300,
    db = c(0,50, 100, 150, 200, 250, 300),
    lam = c(3.01, 7.42, 20.51, 1.60, 0.42, 3.42, 8.24, 0.66, 0.32, 0.39, 0.46, 0.52,
      0.63, 0.36, 4.93, 0.47, 2.07, 0.42, 0.48, 0.47), 
    sigma = c(110, 91, 70, 114, 135, 101, 88, 130, 133, 134, 134, 135, 131, 135, 100,
      135, 110, 135, 134, 135), 
    phi = 0.6, gamma = 0.35,
    npoints = 15, nyrs = 4)
str(tmp)
# Compare the number detected with the true numbers present
with(tmp, cbind(y, N[cell, ]))



