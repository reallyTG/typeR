library(VGAM)


### Name: zinegbinomial
### Title: Zero-Inflated Negative Binomial Distribution Family Function
### Aliases: zinegbinomial zinegbinomialff
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1
##D ndata <- data.frame(x2 = runif(nn <- 1000))
##D ndata <- transform(ndata, pstr0 = logit(-0.5 + 1 * x2, inverse = TRUE),
##D                           munb  =   exp( 3   + 1 * x2),
##D                           size  =   exp( 0   + 2 * x2))
##D ndata <- transform(ndata,
##D                    y1 = rzinegbin(nn, mu = munb, size = size, pstr0 = pstr0))
##D with(ndata, table(y1)["0"] / sum(table(y1)))
##D nfit <- vglm(y1 ~ x2, zinegbinomial(zero = NULL), data = ndata)
##D coef(nfit, matrix = TRUE)
##D summary(nfit)
##D head(cbind(fitted(nfit), with(ndata, (1 - pstr0) * munb)))
##D round(vcov(nfit), 3)
##D 
##D 
##D # Example 2: RR-ZINB could also be called a COZIVGLM-ZINB-2
##D ndata <- data.frame(x2 = runif(nn <- 2000))
##D ndata <- transform(ndata, x3 = runif(nn))
##D ndata <- transform(ndata, eta1 =          3   + 1   * x2 + 2 * x3)
##D ndata <- transform(ndata, pstr0  = logit(-1.5 + 0.5 * eta1, inverse = TRUE),
##D                           munb = exp(eta1),
##D                           size = exp(4))
##D ndata <- transform(ndata,
##D                    y1 = rzinegbin(nn, pstr0 = pstr0, mu = munb, size = size))
##D with(ndata, table(y1)["0"] / sum(table(y1)))
##D rrzinb <- rrvglm(y1 ~ x2 + x3, zinegbinomial(zero = NULL), data = ndata,
##D                  Index.corner = 2, str0 = 3, trace = TRUE)
##D coef(rrzinb, matrix = TRUE)
##D Coef(rrzinb)
## End(Not run)



