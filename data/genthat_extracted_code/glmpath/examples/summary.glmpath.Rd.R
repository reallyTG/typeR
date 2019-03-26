library(glmpath)


### Name: summary.glmpath
### Title: Produces an anova-type summary for a glmpath object
### Aliases: summary.glmpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
fit <- glmpath(x, y)
summary(fit)
detach(heart.data)



