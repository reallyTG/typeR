library(mlogit)


### Name: mFormula
### Title: Model formula for logit models
### Aliases: mFormula is.mFormula mFormula.formula model.matrix.mFormula
###   model.frame.mFormula
### Keywords: models

### ** Examples

data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice =
"mode")

# a formula with to alternative specific variables (price and catch) and
# an intercept
f1 <- mFormula(mode ~ price + catch)
head(model.matrix(f1, Fish), 2)

# same, with an individual specific variable (income)
f2 <- mFormula(mode ~ price + catch | income)
head(model.matrix(f2, Fish), 2)

# same, without an intercept
f3 <- mFormula(mode ~ price + catch | income + 0)
head(model.matrix(f3, Fish), 2)

# same as f2, but now, coefficients of catch are alternative specific
f4 <- mFormula(mode ~ price | income | catch)
head(model.matrix(f4, Fish), 2)



