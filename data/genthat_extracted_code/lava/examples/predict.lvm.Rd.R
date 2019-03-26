library(lava)


### Name: predict.lvm
### Title: Prediction in structural equation models
### Aliases: predict.lvm predict.lvmfit

### ** Examples

m <- lvm(list(c(y1,y2,y3)~u,u~x)); latent(m) <- ~u
d <- sim(m,100)
e <- estimate(m,d)

## Conditional mean (and variance as attribute) given covariates
r <- predict(e)
## Best linear unbiased predictor (BLUP)
r <- predict(e,vars(e))
##  Conditional mean of y3 giving covariates and y1,y2
r <- predict(e,y3~y1+y2)
##  Conditional mean  gives covariates and y1
r <- predict(e,~y1)
##  Predicted residuals (conditional on all observed variables)
r <- predict(e,vars(e),residual=TRUE)




