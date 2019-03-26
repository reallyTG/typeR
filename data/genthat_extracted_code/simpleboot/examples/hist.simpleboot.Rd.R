library(simpleboot)


### Name: hist.simpleboot
### Title: Histograms for bootstrap sampling distributions.
### Aliases: hist.simpleboot
### Keywords: hplot

### ** Examples

x <- rnorm(100)

## Bootstrap the 75th percentile
b <- one.boot(x, quantile, R = 1000, probs = 0.75)
hist(b)



