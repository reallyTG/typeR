library(rtrim)


### Name: plot.trim.index
### Title: Plot time-indices from trim output.
### Aliases: plot.trim.index

### ** Examples


# Simple example
data(skylark2)
z <- trim(count ~ site + year, data=skylark2, model=3)
idx <- index(z)
plot(idx)

# Example with user-modified title, and different y-axis scaling
plot(idx, main="Skylark", pct=TRUE)

# Using covariates:
z <- trim(count ~ site + year + habitat, data=skylark2, model=3)
idx <- index(z, covars=TRUE)
plot(idx)

# Suppressing the plotting of covariate indices:
plot(idx, covar="none")




