library(VGAM)


### Name: gompertz
### Title: Gompertz Distribution Family Function
### Aliases: gompertz
### Keywords: models regression

### ** Examples

## Not run: 
##D gdata <- data.frame(x2 = runif(nn <- 1000))
##D gdata <- transform(gdata, eta1  = -1,
##D                           eta2  = -1 + 0.2 * x2,
##D                           ceta1 =  1,
##D                           ceta2 = -1 + 0.2 * x2)
##D gdata <- transform(gdata, shape1 = exp(eta1),
##D                           shape2 = exp(eta2),
##D                           scale1 = exp(ceta1),
##D                           scale2 = exp(ceta2))
##D gdata <- transform(gdata, y1 = rgompertz(nn, scale = scale1, shape = shape1),
##D                           y2 = rgompertz(nn, scale = scale2, shape = shape2))
##D 
##D fit1 <- vglm(y1 ~ 1,  gompertz, data = gdata, trace = TRUE)
##D fit2 <- vglm(y2 ~ x2, gompertz, data = gdata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D Coef(fit1)
##D summary(fit1)
##D coef(fit2, matrix = TRUE)
##D summary(fit2)
## End(Not run)



