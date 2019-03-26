library(kdevine)


### Name: rkdevine
### Title: Simulate from a kdevine object
### Aliases: rkdevine

### ** Examples

# load and plot data
data(wdbc)
## Don't show: 
wdbc <- wdbc[1:30, ]
## End(Don't show)
# estimate density
fit <- kdevine(wdbc[, 5:7], xmin = rep(0, 3))

# plot simulated data
pairs(rkdevine(nrow(wdbc), fit))




