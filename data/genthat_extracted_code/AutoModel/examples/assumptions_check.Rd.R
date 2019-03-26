library(AutoModel)


### Name: assumptions_check
### Title: Multiple Regression Assumption Checking
### Aliases: assumptions_check

### ** Examples

freeny_model_formulas <- create_formula_objects("y", c("lag.quarterly.revenue")
, c("price.index"))
freeny_models <- create_model_objects(freeny_model_formulas,
dataset = freeny)
freeny_model <- freeny_models[[length(freeny_models)]]
assumptions_check(freeny_model)



