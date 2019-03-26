library(plm)


### Name: within_intercept
### Title: Overall Intercept for Within Models Along its Standard Error
### Aliases: within_intercept within_intercept.plm
### Keywords: attribute

### ** Examples

# estimate within model (unbalanced data)
data("Hedonic", package = "plm")
mod_fe <- plm(mv ~ age + crim, data = Hedonic, index = "townid")
overallint <- within_intercept(mod_fe)
attr(overallint, "se") # standard error

# overall intercept is the weighted mean of fixed effects in the one-way case
weighted.mean(fixef(mod_fe), as.numeric(table(index(mod_fe)[[1]])))

# relationship of type="dmean", "level" and within_intercept in the one-way case
data("Grunfeld", package = "plm")
gi <- plm(inv ~ value + capital, data = Grunfeld, model = "within")
fx_level <- fixef(gi, type = "level")
fx_dmean <- fixef(gi, type = "dmean")
overallint <- within_intercept(gi)
all.equal(overallint + fx_dmean, fx_level, check.attributes = FALSE) # TRUE

# overall intercept with robust standard error
within_intercept(gi, vcov = function(x) vcovHC(x, method="arellano", type="HC0"))



