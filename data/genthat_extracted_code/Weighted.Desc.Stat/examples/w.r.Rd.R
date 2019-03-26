library(Weighted.Desc.Stat)


### Name: w.r
### Title: weighted Pearson's correlation coefficent
### Aliases: w.r
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Pearson's Correlation Coefficent
###   Weighted Covariance Weighted Scatter Plot Weighted Standard Deviation

### ** Examples

x <- c(1:10)
y <- c(2, 7, 0.8, -1, 3, 4, 8, 13, 0, 12)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.r(x, y, mu)

## The function is currently defined as
function(x, y, mu)  w.cov(x,y,mu) / (w.sd(x,mu) * w.sd(y,mu))



