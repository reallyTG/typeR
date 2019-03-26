library(pls)


### Name: coef.mvr
### Title: Extract Information From a Fitted PLSR or PCR Model
### Aliases: coef.mvr fitted.mvr residuals.mvr model.frame.mvr
###   model.matrix.mvr prednames respnames compnames explvar
### Keywords: regression multivariate

### ** Examples

data(yarn)
mod <- pcr(density ~ NIR, data = yarn[yarn$train,], ncomp = 5)
B <- coef(mod, ncomp = 3, intercept = TRUE)
## A manual predict method:
stopifnot(drop(B[1,,] + yarn$NIR[!yarn$train,] %*% B[-1,,]) ==
          drop(predict(mod, ncomp = 3, newdata = yarn[!yarn$train,])))

## Note the difference in formatting:
mod2 <- pcr(density ~ NIR, data = yarn[yarn$train,])
compnames(mod2, explvar = TRUE)[1:3]
compnames(mod2, comps = 1:3, explvar = TRUE)



