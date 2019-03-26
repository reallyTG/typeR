library(jmdl)


### Name: jmdl
### Title: Fit Joint Mean-Correlation Models For Discrete Longitudinal Data
### Aliases: jmdl

### ** Examples

data(toydata)
mydat <- toydata
fit <- jmdl(Y|id|time ~ X, data = mydat, q = 2, family ='Bernoulli')



