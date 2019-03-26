library(VGAM)


### Name: genbetaII
### Title: Generalized Beta Distribution of the Second Kind
### Aliases: genbetaII
### Keywords: models regression

### ** Examples

## Not run: 
##D gdata <- data.frame(y = rsinmad(3000, shape1 = exp(1), scale = exp(2),
##D                                 shape3 = exp(1)))  # A special case!
##D fit <- vglm(y ~ 1, genbetaII(lss = FALSE), data = gdata, trace = TRUE)
##D fit <- vglm(y ~ 1, data = gdata, trace = TRUE,
##D             genbetaII(ishape1.a = 3, iscale = 7, ishape3.q = 2.3))
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



