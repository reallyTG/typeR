library(grt)


### Name: plot.glc
### Title: Plot Method for Class 'glc'
### Aliases: plot.glc
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
plot(fit.2dl)

#if one wants to plot decision bounds in
# colors different from the defaults
plot(fit.2dl, fitdb=FALSE)
abline(coef=coef(fit.2dl$par), col="orange")
abline(coef=coef(fit.2dl$initpar), col="purple")




