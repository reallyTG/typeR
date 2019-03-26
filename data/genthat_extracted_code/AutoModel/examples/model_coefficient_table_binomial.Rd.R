library(AutoModel)


### Name: model_coefficient_table_binomial
### Title: Binary Logistic Regression: Coefficient Table Output
### Aliases: model_coefficient_table_binomial

### ** Examples

formulas <- create_formula_objects("am", c("hp", "mpg"), c("disp"),
c("drat"))
mtcars_models <- create_model_objects(formulas, data=mtcars,
type="binomial")
## Not run: model_summary_table_binomial(mtcars_models)



