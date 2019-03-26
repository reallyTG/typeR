library(Chaos01)


### Name: fast.rqa
### Title: Function to compute diagonal RQA measures for given time series
### Aliases: fast.rqa
### Keywords: determinism, rqa test,

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

res <- fast.rqa(vec.x, dim = 3, lag = 10, eps = 0.3)
summary(res)



