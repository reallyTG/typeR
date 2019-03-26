library(healthcareai)


### Name: get_cutoffs
### Title: Get cutoff values for group predictions
### Aliases: get_cutoffs

### ** Examples

machine_learn(pima_diabetes[1:20, ], patient_id, outcome = diabetes,
              models = "xgb", tune = FALSE) %>%
  predict(risk_groups = 5) %>%
  get_cutoffs()



