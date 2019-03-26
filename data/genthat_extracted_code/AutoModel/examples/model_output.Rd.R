library(AutoModel)


### Name: model_output
### Title: Multiple Regression Output
### Aliases: model_output

### ** Examples

freeny_model_formulas <- create_formula_objects("y",
c("lag.quarterly.revenue"), c("price.index"))
freeny_models <- create_model_objects(freeny_model_formulas,
dataset = freeny)
freeny_model <- freeny_models[[length(freeny_models)]]
checks <- assumptions_check(freeny_model)
model_output(freeny_models, freeny, checks, freeny_model_formulas,
outliers = "significant")



