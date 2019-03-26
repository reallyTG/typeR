library(boot)


### Name: k3.linear
### Title: Linear Skewness Estimate
### Aliases: k3.linear
### Keywords: nonparametric

### ** Examples

#  To estimate the skewness of the ratio of means for the city data.
ratio <- function(d, w) sum(d$x * w)/sum(d$u * w)
k3.linear(empinf(data = city, statistic = ratio))



