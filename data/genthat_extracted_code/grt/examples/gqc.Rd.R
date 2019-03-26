library(grt)


### Name: gqc
### Title: General Quadratic Classifier
### Aliases: gqc print.gqc
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
fit.2dq <- gqc(response ~ x + y, data=subjdemo_2d,
    category=subjdemo_2d$category, zlimit=7)



