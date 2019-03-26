library(spls)


### Name: ci.spls
### Title: Calculate bootstrapped confidence intervals of SPLS coefficients
### Aliases: ci.spls
### Keywords: regression multivariate

### ** Examples

data(mice)
# SPLS with eta=0.6 & 1 hidden components
f <- spls( mice$x, mice$y, K=1, eta=0.6 )
# Calculate confidence intervals of coefficients
ci.f <- ci.spls( f, plot.it=TRUE, plot.fix="x", plot.var=20 )
# Bootstrapped confidence intervals
cis <- ci.f$cibeta
cis[[20]]   # equivalent, 'cis$1422478_a_at'



