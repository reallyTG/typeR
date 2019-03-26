library(VGAM)


### Name: makeham
### Title: Makeham Distribution Family Function
### Aliases: makeham
### Keywords: models regression

### ** Examples

## Not run: 
##D  set.seed(123)
##D mdata <- data.frame(x2 = runif(nn <- 1000))
##D mdata <- transform(mdata, eta1  = -1,
##D                           ceta1 =  1,
##D                           eeta1 = -2)
##D mdata <- transform(mdata, shape1 = exp(eta1),
##D                           scale1 = exp(ceta1),
##D                           epsil1 = exp(eeta1))
##D mdata <- transform(mdata,
##D          y1 = rmakeham(nn, shape = shape1, scale = scale1, eps = epsil1))
##D 
##D # A trick is to fit a Gompertz distribution first
##D fit0 <- vglm(y1 ~ 1, gompertz, data = mdata, trace = TRUE)
##D fit1 <- vglm(y1 ~ 1, makeham, data = mdata,
##D              etastart = cbind(predict(fit0), log(0.1)), trace = TRUE)
##D 
##D coef(fit1, matrix = TRUE)
##D summary(fit1)
## End(Not run)



