library(plm)


### Name: fixef.plm
### Title: Extract the Fixed Effects
### Aliases: fixef.plm fixef print.fixef summary.fixef print.summary.fixef
### Keywords: regression

### ** Examples

data("Grunfeld", package = "plm")
gi <- plm(inv ~ value + capital, data = Grunfeld, model = "within")
fixef(gi)
summary(fixef(gi))
summary(fixef(gi))[ , c("Estimate", "Pr(>|t|)")] # only estimates and p-values

# relationship of type = "dmean" and "level" and overall intercept
fx_level <- fixef(gi, type = "level")
fx_dmean <- fixef(gi, type = "dmean")
overallint <- within_intercept(gi)
all.equal(overallint + fx_dmean, fx_level, check.attributes = FALSE) # TRUE

# extract time effects in a twoways effects model
gi_tw <- plm(inv ~ value + capital, data = Grunfeld,
          model = "within", effect = "twoways")
fixef(gi_tw, effect = "time")

# with supplied variance-covariance matrix as matrix, function,
# and function with additional arguments
fx_level_robust1 <- fixef(gi, vcov = vcovHC(gi))
fx_level_robust2 <- fixef(gi, vcov = vcovHC)
fx_level_robust3 <- fixef(gi, vcov = function(x) vcovHC(x, method = "white2"))
summary(fx_level_robust1) # gives fixed effects, robust SEs, t- and p-values

# calc. fitted values of oneway within model:
fixefs <- fixef(gi)[index(gi, which = "id")]
fitted_by_hand <- fixefs + gi$coefficients["value"] * gi$model$value +
                           gi$coefficients["capital"] * gi$model$capital



