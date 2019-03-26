library(Weighted.Desc.Stat)


### Name: w.mean
### Title: weighted mean
### Aliases: w.mean
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Mean

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.mean(x, mu)

## The function is currently defined as
function(x, mu)  sum( mu*abs(x-w.mean(x,mu)) ) / sum(mu)



