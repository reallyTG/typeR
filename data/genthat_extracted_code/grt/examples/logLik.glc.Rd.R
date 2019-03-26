library(grt)


### Name: logLik.glc
### Title: Log-Likelihood of a 'glc' or 'gcjc' Object
### Aliases: logLik.glc logLik.gcjc
### Keywords: models

### ** Examples

data(subjdemo_2d)
fit <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
logLik(fit)



