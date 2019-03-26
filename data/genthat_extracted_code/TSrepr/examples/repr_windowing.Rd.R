library(TSrepr)


### Name: repr_windowing
### Title: Windowing of time series
### Aliases: repr_windowing

### ** Examples

# func without arguments
repr_windowing(rnorm(48), win_size = 24, func = repr_feaclip)

# func with arguments
repr_windowing(rnorm(48), win_size = 24, func = repr_featrend,
 args = list(func = maxC, order = 2, pieces = 2))




