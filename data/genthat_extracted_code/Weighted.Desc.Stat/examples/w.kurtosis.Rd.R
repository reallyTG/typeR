library(Weighted.Desc.Stat)


### Name: w.kurtosis
### Title: weighted coefficient of kurtosis
### Aliases: w.kurtosis
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Coefficient of Kurtosis Weighted Mean
###   Weighted Standard Deviation

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.kurtosis(x, mu)

## The function is currently defined as
function(x, mu)  (( sum( mu*(x-w.mean(x,mu))^4 ) / sum(mu) ) / w.sd(x,mu)^4)-3



