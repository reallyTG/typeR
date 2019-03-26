library(VGAM)


### Name: frechet
### Title: Frechet Distribution Family Function
### Aliases: frechet
### Keywords: models regression

### ** Examples

## Not run: 
##D set.seed(123)
##D fdata <- data.frame(y1 = rfrechet(nn <- 1000, shape = 2 + exp(1)))
##D with(fdata, hist(y1))
##D fit2 <- vglm(y1 ~ 1, frechet, data = fdata, trace = TRUE)
##D coef(fit2, matrix = TRUE)
##D Coef(fit2)
##D head(fitted(fit2))
##D with(fdata, mean(y1))
##D head(weights(fit2, type = "working"))
##D vcov(fit2)
## End(Not run)



