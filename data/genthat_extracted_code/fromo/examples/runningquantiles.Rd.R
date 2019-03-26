library(fromo)


### Name: running_apx_quantiles
### Title: Compute approximate quantiles over a sliding window
### Aliases: running_apx_quantiles running_apx_median

### ** Examples

x <- rnorm(1e5)
xq <- running_apx_quantiles(x,c(0.1,0.25,0.5,0.75,0.9))
xm <- running_apx_median(x)




