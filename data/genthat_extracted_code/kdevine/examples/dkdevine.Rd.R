library(kdevine)


### Name: dkdevine
### Title: Evaluate the density of a kdevine object
### Aliases: dkdevine

### ** Examples

# load data
data(wdbc)
## Don't show: 
wdbc <- wdbc[1:30, ]
## End(Don't show)
# estimate density (use xmin to indicate positive support)
fit <- kdevine(wdbc[, 5:7], xmin = rep(0, 3))

# evaluate density estimate
dkdevine(c(1000, 0.1, 0.1), fit)




