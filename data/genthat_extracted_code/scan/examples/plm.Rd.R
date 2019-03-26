library(scan)


### Name: plm
### Title: Piecewise linear model / piecewise regression
### Aliases: plm

### ** Examples

## Compute a piecewise regression model for a random single-case
dat <- rSC(1, MT = 30, B.start = 11, d.level = 1.0, d.slope = 0.05, d.trend = 0.05)
plm(dat, AR = 3)



