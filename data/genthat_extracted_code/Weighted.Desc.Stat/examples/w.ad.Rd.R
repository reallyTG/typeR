library(Weighted.Desc.Stat)


### Name: w.ad
### Title: weighted absolute deviation
### Aliases: w.ad
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Absolute Deviation

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.ad(x, mu)

## The function is currently defined as
function(x, mu)  sum( mu*abs(x- w.mean(x,mu) ) ) / sum(mu)



