library(grt)


### Name: glc
### Title: General Linear Classifier
### Aliases: glc print.glc
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
d2 <- subjdemo_2d
#fit a 2d suboptimal model
fit.2dl <- glc(response ~ x + y, data=d2, category=d2$category, zlimit=7)
#fit a 1d model (on the dimention 'y') on the same dataset
fit.1dy <- glc(response ~ y, data=d2, category=d2$category, zlimit=7)
#or using update()
#fit.1dy <- update(fit.2dl, . ~ . -x)

#fit a 2d optimal model
fit.2dlopt <- glc(response ~ x + y, data=d2, category=d2$category, zlimit=7, 
    fixed=list(coeffs=TRUE, bias=TRUE))

#calculate AIC and compare
AIC(fit.2dl, fit.1dy, fit.2dlopt)



