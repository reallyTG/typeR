library(VGAM)


### Name: hormone
### Title: Hormone Assay Data
### Aliases: hormone
### Keywords: datasets

### ** Examples

## Not run: 
##D data(hormone)
##D summary(hormone)
##D 
##D modelI <-rrvglm(Y ~ 1 + X, data = hormone, trace = TRUE,
##D                 uninormal(zero = NULL, lsd = "identitylink", imethod = 2))
##D 
##D # Alternative way to fit modelI
##D modelI.other <- vglm(Y ~ 1 + X, data = hormone, trace = TRUE,
##D                      uninormal(zero = NULL, lsd = "identitylink"))
##D 
##D # Inferior to modelI
##D modelII <- vglm(Y ~ 1 + X, data = hormone, trace = TRUE,
##D                 family = uninormal(zero = NULL))
##D 
##D logLik(modelI)
##D logLik(modelII)  # Less than logLik(modelI)
##D 
##D 
##D # Reproduce the top 3 equations on p.65 of Carroll and Ruppert (1988).
##D # They are called Equations (1)--(3) here.
##D 
##D # Equation (1)
##D hormone <- transform(hormone, rX = 1 / X)
##D clist <- list("(Intercept)" = diag(2), X = diag(2), rX = rbind(0, 1))
##D fit1 <- vglm(Y ~ 1 + X + rX, family = uninormal(zero = NULL),
##D              constraints = clist, data = hormone, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D summary(fit1)  # Actually, the intercepts do not seem significant
##D plot(Y ~ X, hormone, col = "blue")
##D lines(fitted(fit1) ~ X, hormone, col = "orange")
##D 
##D # Equation (2)
##D fit2 <- rrvglm(Y ~ 1 + X, uninormal(zero = NULL), hormone, trace = TRUE)
##D coef(fit2, matrix = TRUE)
##D plot(Y ~ X, hormone, col = "blue")
##D lines(fitted(fit2) ~ X, hormone, col = "red")
##D # Add +- 2 SEs
##D lines(fitted(fit2) + 2 * exp(predict(fit2)[, "loge(sd)"]) ~ X,
##D       hormone, col = "orange")
##D lines(fitted(fit2) - 2 * exp(predict(fit2)[, "loge(sd)"]) ~ X,
##D       hormone, col = "orange")
##D 
##D # Equation (3)
##D # Does not fit well because the loge link for the mean is not good.
##D fit3 <- rrvglm(Y ~ 1 + X, maxit = 300, data = hormone, trace = TRUE,
##D                uninormal(lmean = "loge", zero = NULL))
##D coef(fit3, matrix = TRUE)
##D plot(Y ~ X, hormone, col = "blue")  # Does not look okay.
##D lines(exp(predict(fit3)[, 1]) ~ X, hormone, col = "red")
##D # Add +- 2 SEs
##D lines(fitted(fit3) + 2 * exp(predict(fit3)[, "loge(sd)"]) ~ X,
##D       hormone, col = "orange")
##D lines(fitted(fit3) - 2 * exp(predict(fit3)[, "loge(sd)"]) ~ X,
##D       hormone, col = "orange")
## End(Not run)



