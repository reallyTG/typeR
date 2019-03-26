library(pointRes)


### Name: res.plot
### Title: Plot resilience components
### Aliases: res.plot

### ** Examples

## Plot resilience components for all defined pointer years
# note: pointer years with < 5 series (here 1882) are not displayed (warning)
data(s033)
res <- res.comp(s033, nb.yrs = 4, res.thresh.neg = 40, series.thresh = 75)
res.plot(res, select.yr = NULL, multi.panel = TRUE)

## Plot resilience components for selected years
# note: inclusion of non-pointer years (here 2002) results in a warning
data(s033)
res <- res.comp(s033, nb.yrs = 4, res.thresh.neg = 40, series.thresh = 75)
res.plot(res, select.yr = c(1948, 1992, 2002), multi.panel = TRUE)




