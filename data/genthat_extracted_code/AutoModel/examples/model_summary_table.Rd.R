library(AutoModel)


### Name: model_summary_table
### Title: Hierarchical regression: model summary output
### Aliases: model_summary_table

### ** Examples

freeny_model_formulas <- create_formula_objects("y",
c("lag.quarterly.revenue"), c("price.index"))
freeny_models <- create_model_objects(freeny_model_formulas,
dataset = freeny)
model_summary_table(freeny_models, freeny_model_formulas)



