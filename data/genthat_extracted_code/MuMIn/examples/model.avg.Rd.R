library(MuMIn)


### Name: model.avg
### Title: Model averaging
### Aliases: model.avg model.avg.default model.avg.model.selection
###   print.averaging
### Keywords: models

### ** Examples


# Example from Burnham and Anderson (2002), page 100:
fm1 <- lm(y ~ ., data = Cement, na.action = na.fail)
(ms1 <- dredge(fm1))

#models with delta.aicc < 4
summary(model.avg(ms1, subset = delta < 4))

#or as a 95% confidence set:
avgmod.95p <- model.avg(ms1, cumsum(weight) <= .95)
confint(avgmod.95p)

## Not run: 
##D # The same result, but re-fitting the models via 'get.models'
##D confset.95p <- get.models(ms1, cumsum(weight) <= .95)
##D model.avg(confset.95p)
##D 
##D # Force re-fitting the component models
##D model.avg(ms1, cumsum(weight) <= .95, fit = TRUE)
##D # Models are also fitted if additional arguments are given
##D model.avg(ms1, cumsum(weight) <= .95, rank = "AIC")
## End(Not run)

## Not run: 
##D # using BIC (Schwarz's Bayesian criterion) to rank the models
##D BIC <- function(x) AIC(x, k = log(length(residuals(x))))
##D model.avg(confset.95p, rank = BIC)
##D # the same result, using AIC directly, with argument k
##D # 'x' in a quoted 'rank' argument is substituted with a model object
##D # (in this case it does not make much sense as the number of observations is
##D # common to all models)
##D model.avg(confset.95p, rank = AIC, rank.args = alist(k = log(length(residuals(x)))))
## End(Not run)




