library(VGAM)


### Name: perks
### Title: Perks Distribution Family Function
### Aliases: perks
### Keywords: models regression

### ** Examples

## Not run: 
##D  set.seed(123)
##D pdata <- data.frame(x2 = runif(nn <- 1000))  # x2 unused
##D pdata <- transform(pdata, eta1  = -1,
##D                           ceta1 =  1)
##D pdata <- transform(pdata, shape1 = exp(eta1),
##D                           scale1 = exp(ceta1))
##D pdata <- transform(pdata, y1 = rperks(nn, shape = shape1, scale = scale1))
##D fit1 <- vglm(y1 ~ 1, perks, data = pdata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D summary(fit1)
## End(Not run)



