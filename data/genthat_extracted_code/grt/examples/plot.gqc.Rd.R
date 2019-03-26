library(grt)


### Name: plot.gqc
### Title: plot Method for Class 'gqc'
### Aliases: plot.gqc
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
fit.2dq <- gqc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
plot(fit.2dq)




