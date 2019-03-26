library(AutoModel)


### Name: model_summary_table_binomial
### Title: Binary Logistic Regression: Model Summary Output
### Aliases: model_summary_table_binomial

### ** Examples

formulas <- create_formula_objects("am", c("hp", "mpg"), c("disp"),
c("drat"))
mtcars_models <- create_model_objects(formulas, data=mtcars,
type="binomial")
last_model <- mtcars_models[[length(mtcars_models)]]



