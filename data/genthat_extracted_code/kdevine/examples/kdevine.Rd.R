library(kdevine)


### Name: kdevine
### Title: Kernel density estimatior based on simplified vine copulas
### Aliases: kdevine

### ** Examples

# load data
data(wdbc, package = "kdecopula")
## Don't show: 
wdbc <- wdbc[1:30, ]
## End(Don't show)
# estimate density (use xmin to indicate positive support)
fit <- kdevine(wdbc[, 5:7], xmin = rep(0, 3))

# evaluate density estimate
dkdevine(c(1000, 0.1, 0.1), fit)

# plot simulated data
pairs(rkdevine(nrow(wdbc), fit))




