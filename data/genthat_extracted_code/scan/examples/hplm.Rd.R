library(scan)


### Name: hplm
### Title: Hierarchical piecewise linear model / piecewise regression
### Aliases: hplm

### ** Examples

## Compute hpl model on a MBD over three cases (restricted log-likelihood)
dat <- rSC(3, MT = 30, B.start = 11, d.level = 1.0, d.slope = 0.05, d.trend = 0.05)
hplm(dat, method = "REML",random.slopes = FALSE)

## Use hplm with default settings
dat <- rSC(15, MT = 30, B.start = 11, d.level = 1.0, d.slope = runif(15,0,0.2), d.trend = 0.05)
hplm(dat)



