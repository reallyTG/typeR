library(CalibratR)


### Name: BBQ_CV
### Title: BBQ_CV
### Aliases: BBQ_CV

### ** Examples

 ## Loading dataset in environment
 data(example)
 actual <- example$actual
 predicted <- example$predicted
 BBQ_model <- CalibratR:::BBQ_CV(actual, predicted, method_for_prediction=0, n_folds=4, 123, 1)



