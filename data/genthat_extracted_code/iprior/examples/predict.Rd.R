library(iprior)


### Name: predict
### Title: Obtain predicted values from 'ipriorMod' objects
### Aliases: predict fitted.ipriorMod predict.ipriorMod print.ipriorPredict

### ** Examples

dat <- gen_smooth(20)
mod <- iprior(y ~ ., dat, kernel = "se")
fitted(mod)
fitted(mod, intervals = TRUE)
predict(mod, gen_smooth(5))

with(dat, mod <<- iprior(y, X, kernel = "poly"))
newdat <- gen_smooth(30)
mod.pred <- predict(mod, list(newdat$X), y.test = newdat$y, intervals = TRUE)
str(mod.pred)
print(mod.pred, row = 5)




