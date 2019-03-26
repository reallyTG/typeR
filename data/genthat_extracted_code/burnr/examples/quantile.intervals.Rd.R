library(burnr)


### Name: quantile.intervals
### Title: Fit distribution quantiles.
### Aliases: quantile.intervals

### ** Examples

data(pgm)
intervs <- intervals(composite(pgm))
quantile(intervs)

# Or you can pass in your own quantiles:
quantile(intervs, q = c(0.25, 0.5, 0.75))




