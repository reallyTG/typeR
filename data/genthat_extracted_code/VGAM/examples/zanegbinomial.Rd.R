library(VGAM)


### Name: zanegbinomial
### Title: Zero-Altered Negative Binomial Distribution
### Aliases: zanegbinomial zanegbinomialff
### Keywords: models regression

### ** Examples

## Not run: 
##D zdata <- data.frame(x2 = runif(nn <- 2000))
##D zdata <- transform(zdata, pobs0 = logit(-1 + 2*x2, inverse = TRUE))
##D zdata <- transform(zdata,
##D          y1 = rzanegbin(nn, munb = exp(0+2*x2), size = exp(1), pobs0 = pobs0),
##D          y2 = rzanegbin(nn, munb = exp(1+2*x2), size = exp(1), pobs0 = pobs0))
##D with(zdata, table(y1))
##D with(zdata, table(y2))
##D 
##D fit <- vglm(cbind(y1, y2) ~ x2, zanegbinomial, data = zdata, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D head(fitted(fit))
##D head(predict(fit))
## End(Not run)



