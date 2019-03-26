library(metR)


### Name: FitLm
### Title: Fast estimates of linear regression
### Aliases: FitLm

### ** Examples

# Linear trend with "signficant" areas shaded with points
library(data.table)
library(ggplot2)
system.time({
  regr <- geopotential[, FitLm(gh, date, se = TRUE), by = .(lon, lat)]
})

ggplot(regr[term != "(intercept)"], aes(lon, lat)) +
    geom_contour(aes(z = estimate, color = ..level..)) +
    stat_subset(aes(subset = abs(estimate) > 2*std.error), size = 0.05)

# Using stats::lm() is much slower and with no names.
## Not run: 
##D system.time({
##D   regr <- geopotential[, coef(lm(gh ~ date)), by = .(lon, lat)]
##D })
## End(Not run)




