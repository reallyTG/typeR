library(soundgen)


### Name: pDistr
### Title: Proportion of total
### Aliases: pDistr
### Keywords: internal

### ** Examples

x = rnorm(100)
x = x - min(x)  # must be non-negative
hist(x)
v = soundgen:::pDistr(x, quantiles = c(.5, .8, .9))
sum(x[x > v['0.5']]) / sum(x)
sum(x[x > v['0.9']]) / sum(x)



