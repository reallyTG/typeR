library(mlogit)


### Name: effects.mlogit
### Title: Marginal effects of the covariates
### Aliases: effects.mlogit
### Keywords: regression

### ** Examples

data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice = "mode")
m <- mlogit(mode ~ price | income | catch, data = Fish)
# compute a data.frame containing the mean value of the covariates in
# the sample
z <- with(Fish, data.frame(price = tapply(price, index(m)$alt, mean),
                           catch = tapply(catch, index(m)$alt, mean),
                           income = mean(income)))
# compute the marginal effects (the second one is an elasticity
effects(m, covariate = "income", data = z)
effects(m, covariate = "price", type = "rr", data = z)
effects(m, covariate = "catch", type = "ar", data = z)



