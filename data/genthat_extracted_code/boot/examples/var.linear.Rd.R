library(boot)


### Name: var.linear
### Title: Linear Variance Estimate
### Aliases: var.linear
### Keywords: nonparametric

### ** Examples

#  To estimate the variance of the ratio of means for the city data.
ratio <- function(d,w) sum(d$x * w)/sum(d$u * w)
var.linear(empinf(data = city, statistic = ratio))



