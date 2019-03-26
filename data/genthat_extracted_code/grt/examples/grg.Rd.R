library(grt)


### Name: grg
### Title: General Random Guessing model
### Aliases: grg
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
fit.grand <- grg(subjdemo_2d$response, fixed=FALSE)

fit.frand <- grg(subjdemo_2d$response, fixed=TRUE)



