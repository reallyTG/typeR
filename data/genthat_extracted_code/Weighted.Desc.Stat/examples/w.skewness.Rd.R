library(Weighted.Desc.Stat)


### Name: w.skewness
### Title: weighted coefficient of skewness
### Aliases: w.skewness
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Coefficient of Skewness Weighted Mean
###   Weighted Standard Deviation

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.skewness(x, mu)

## The function is currently defined as
function(x, mu)  ( sum( mu*(x-w.mean(x,mu))^3 ) / sum(mu) ) / w.sd(x,mu)^3



