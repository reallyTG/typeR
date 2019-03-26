library(Weighted.Desc.Stat)


### Name: w.cv
### Title: weighted coefficient of variation
### Aliases: w.cv
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Coefficient of Variation Weighted
###   Mean Weighted Standard Deviation

### ** Examples

x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.cv(x, mu)

## The function is currently defined as
function(x, mu)  w.sd(x,mu) / w.mean(x,mu)



