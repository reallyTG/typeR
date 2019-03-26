library(qgam)


### Name: check.learnFast
### Title: Visual checks for the output of tuneLearnFast()
### Aliases: check.learnFast

### ** Examples

library(qgam)
set.seed(525)
dat <- gamSim(1, n=200)
b <- tuneLearnFast(y ~ s(x0)+s(x1)+s(x2)+s(x3), 
                   data = dat, qu = c(0.4, 0.5), 
                   control = list("tol" = 0.05)) # <- sloppy tolerance to speed-up calibration 
check(b) 
check(b, 3) # Produces only third plot




