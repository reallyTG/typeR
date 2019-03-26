library(grpregOverlap)


### Name: grpregOverlap
### Title: Fit penalized regression models with overlapping grouped
###   variables
### Aliases: grpregOverlap
### Keywords: grpregOverlap models

### ** Examples

## linear regression, a simulation demo.
set.seed(123)
group <- list(gr1 = c(1, 2, 3), gr2 = c(1, 4), gr3 = c(2, 4, 5), 
              gr4 = c(3, 5), gr5 = c(6))
beta.latent.T <- c(5, 5, 5, 0, 0, 0, 0, 0, 5, 5, 0) # true latent coefficients.
# beta.T <- c(5, 5, 10, 0, 5, 0), true variables: 1, 2, 3, 5; true groups: 1, 4.
X <- matrix(rnorm(n = 6*100), ncol = 6)  
X.latent <- expandX(X, group)
y <- X.latent %*% beta.latent.T + rnorm(100)

fit <- grpregOverlap(X, y, group, penalty = 'grLasso')
# fit <- grpregOverlap(X, y, group, penalty = 'grMCP')
# fit <- grpregOverlap(X, y, group, penalty = 'grSCAD')
head(coef(fit, latent = TRUE)) # compare to beta.latent.T
plot(fit, latent = TRUE) 
head(coef(fit, latent = FALSE)) # compare to beta.T
plot(fit, latent = FALSE)

cvfit <- cv.grpregOverlap(X, y, group, penalty = 'grMCP')
plot(cvfit)
head(coef(cvfit))
summary(cvfit)

## logistic regression, real data, pathway selection
data(pathway.dat)
X <- pathway.dat$expression
group <- pathway.dat$pathways
y <- pathway.dat$mutation
fit <- grpregOverlap(X, y, group, penalty = 'grLasso', family = 'binomial')
plot(fit)
str(select(fit))
str(select(fit,criterion="AIC",df="active"))

## Not run: 
##D cvfit <- cv.grpregOverlap(X, y, group, penalty = 'grLasso', family = 'binomial')
##D coef(cvfit)
##D predict(cvfit, X, type='response')
##D predict(cvfit, X, type = 'class')
##D plot(cvfit)
##D plot(cvfit, type = 'all')
##D summary(cvfit)
## End(Not run)



