library(glmpath)


### Name: summary.coxpath
### Title: Produces an anova-type summary for a coxpath object
### Aliases: summary.coxpath
### Keywords: models regression

### ** Examples

data(lung.data)
attach(lung.data)
fit <- coxpath(lung.data)
summary(fit)
detach(lung.data)



