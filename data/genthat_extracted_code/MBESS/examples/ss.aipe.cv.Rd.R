library(MBESS)


### Name: ss.aipe.cv
### Title: Sample size planning for the coefficient of variation given the
###   goal of Accuracy in Parameter Estimation approach to sample size
###   planning
### Aliases: ss.aipe.cv
### Keywords: design htest

### ** Examples

# Suppose one wishes to have a confidence interval with an expected width of .10 
# for a 99% confidence interval when the population coefficient of variation is .25.
ss.aipe.cv(C.of.V=.1, width=.1, conf.level=.99)

# Ensuring that the confidence interval will be sufficiently narrow with a 99% 
# certainty for the situation above.
ss.aipe.cv(C.of.V=.1, width=.1, conf.level=.99, degree.of.certainty=.99)



