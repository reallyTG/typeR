library(AutoModel)


### Name: classification_table
### Title: Binary Logistic Regression: Classification Table
### Aliases: classification_table

### ** Examples

formulas <- create_formula_objects("am", c("hp", "mpg"), c("disp"),
c("drat"))
mtcars_models <- create_model_objects(formulas, data=mtcars,
type="binomial")
last_model <- mtcars_models[[length(mtcars_models)]]
classification_table(last_model, last_model$model[,1])



