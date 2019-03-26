library(AutoModel)


### Name: model_output_binomial
### Title: Binary Logistic Regression: Model Output
### Aliases: model_output_binomial

### ** Examples

formulas <- create_formula_objects("am", c("hp", "mpg"), c("disp"),
c("drat"))
mtcars_models <- create_model_objects(formulas, data=mtcars,
type="binomial")
model_output_binomial(mtcars_models, formulas)



