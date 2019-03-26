library(Weighted.Desc.Stat)


### Name: w.cov
### Title: weighted covariance
### Aliases: w.cov
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Mean Weighted Scatter Plot Weighted
###   Pearson's Correlation Coefficent Weighted Covariance

### ** Examples

x <- c(1:10)
y <- c(10:1)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.cov(x, y, mu)

## The function is currently defined as
function(x, y, mu)  (sum(mu*x*y)/sum(mu)) - (w.mean(x,mu) * w.mean(y,mu))



