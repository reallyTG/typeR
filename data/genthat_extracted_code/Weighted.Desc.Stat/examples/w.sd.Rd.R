library(Weighted.Desc.Stat)


### Name: w.sd
### Title: weighted standard deviation
### Aliases: w.sd
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Mean Weighted Standard Deviation

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.sd(x, mu)

## The function is currently defined as
function(x, mu)  ( (sum(mu*x*x)/sum(mu)) - w.mean(x,mu)^2 )^.5



