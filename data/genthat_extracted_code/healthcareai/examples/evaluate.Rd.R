library(healthcareai)


### Name: evaluate
### Title: Get model performance metrics
### Aliases: evaluate evaluate.predicted_df evaluate.model_list

### ** Examples

models <- machine_learn(pima_diabetes[1:40, ],
                       patient_id,
                       outcome = diabetes,
                       models = c("XGB", "RF"),
                       tune = FALSE,
                       n_folds = 3)

# By default, evaluate returns performance of only the best model
evaluate(models)

# Set all_models = TRUE to see the performance of all trained models
evaluate(models, all_models = TRUE)

# Can also get performance on a test dataset
predictions <- predict(models, newdata = pima_diabetes[41:50, ])
evaluate(predictions)



