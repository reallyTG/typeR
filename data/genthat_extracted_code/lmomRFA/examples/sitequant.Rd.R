library(lmomRFA)


### Name: sitequant
### Title: Quantiles and quantile functions for individual sites in a
###   region
### Aliases: siteqfunc sitequant
### Keywords: misc

### ** Examples

rfit <- regfit(Cascades, "gno")   # Fit regional distribution

## Quantiles for:
# - sites in the Cascades data set, indexed by number
sitequant(c(0.9, 0.99, 0.999), rfit, sitenames=1:3)

# - sites in the Cascades data set, indexed by name
sitequant(c(0.9, 0.99, 0.999), rfit,
  sitenames=c("350304", "351433", "351862"))

# - other sites, with specified index floods
sitequant(c(0.9, 0.99, 0.999), rfit, index=c(80, 100))

# - other sites, with specified index floods and names
sitequant(c(0.9, 0.99, 0.999), rfit, index=c(80, 100),
  sitenames=c("Site 80", "Site 100"))

# - a single site, with drop=FALSE: result is a matrix
sitequant(c(0.9, 0.99, 0.999), rfit, sitenames=10, drop=FALSE)

# - a single site, with drop=TRUE (the default): result is a vector
sitequant(c(0.9, 0.99, 0.999), rfit, sitenames=10)

# Quantile function for site 10
qfunc10 <- siteqfunc(rfit, site=10)

# Compute quantiles via the quantile function
qfunc10(c(0.9, 0.99, 0.999))

# Plot the quantile function
evplot(qfunc=qfunc10)




