library(AutoModel)


### Name: model_coefficient_table
### Title: Hierarchical regression: Coefficient table output
### Aliases: model_coefficient_table

### ** Examples

freeny_model_formulas <- create_formula_objects("y", c("lag.quarterly.revenue")
, c("price.index"))
freeny_models <- create_model_objects(freeny_model_formulas,
dataset = freeny)
model_coefficient_table(freeny_models)



