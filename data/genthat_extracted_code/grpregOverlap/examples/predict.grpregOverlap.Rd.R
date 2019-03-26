library(grpregOverlap)


### Name: predict.grpregOverlap
### Title: Model predictions based on a fitted object
### Aliases: predict.grpregOverlap coef.grpregOverlap
###   predict.cv.grpregOverlap coef.cv.grpregOverlap
### Keywords: predict

### ** Examples

data(pathway.dat)
X <- pathway.dat$expression
group <- pathway.dat$pathways
y <- pathway.dat$mutation
fit <- grpregOverlap(X, y, group, penalty = 'grLasso', family = 'binomial')
head(predict(fit, type = 'ngroups', lambda = 0.01))
head(predict(fit, type = 'nvars', lambda = 0.01))
head(predict(fit, type = 'vars', latent = TRUE, lambda = 0.01))
head(predict(fit, type = 'groups', latent = TRUE, lambda = 0.01)) # A note printed.
head(predict(fit, X, type="class", lambda=.01))
head(predict(fit, X, type = "coefficients", lambda = 0.01))
head(predict(fit, type="norm", lambda=.01))

## Not run: 
##D cvfit <- cv.grpregOverlap(X, y, group, penalty = 'grLasso', family = 'binomial')
##D head(coef(cvfit))
##D predict(cvfit, X, type='response')
##D predict(cvfit, X, type = 'link')
##D predict(cvfit, X, type = 'class')
## End(Not run)



