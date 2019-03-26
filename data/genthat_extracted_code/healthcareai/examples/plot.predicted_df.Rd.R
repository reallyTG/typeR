library(healthcareai)


### Name: plot.predicted_df
### Title: Plot model predictions vs observed outcomes
### Aliases: plot.predicted_df plot_regression_predictions
###   plot_classification_predictions plot_multiclass_predictions

### ** Examples

# Some regression examples
models <- machine_learn(pima_diabetes[1:50, ], patient_id, outcome = plasma_glucose,
                        models = "rf", tune = FALSE)
predictions <- predict(models)
plot(predictions)
plot(predictions, caption = "Rsquared",
     title = "This model's predictions regress to the mean",
     point_size = 3, point_alpha = .7, font_size = 9)
p <- plot(predictions, print = FALSE)
p + theme_classic()

# A classification example with risk groups
class_models <- machine_learn(pima_diabetes, patient_id, outcome = diabetes,
                              models = "xgb", tune = FALSE)
predict(class_models,
        risk_groups = c("v low", "low", "medium", "high", "very high")) %>%
  plot()



