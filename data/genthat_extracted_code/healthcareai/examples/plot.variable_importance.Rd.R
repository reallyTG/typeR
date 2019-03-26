library(healthcareai)


### Name: plot.variable_importance
### Title: Plot variable importance
### Aliases: plot.variable_importance

### ** Examples

machine_learn(pima_diabetes[1:50, ], patient_id, outcome = diabetes, tune = FALSE) %>%
  get_variable_importance() %>%
  plot()



