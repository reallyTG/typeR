library(Chaos01)


### Name: summary.chaos01.rqa
### Title: Print all the settings and results of the RQA computation.
### Aliases: summary.chaos01.rqa
### Keywords: print rqa summary

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

res <- fast.rqa(vec.x, dim = 3, lag = 10, eps = 0.3)
summary(res)



