library(healthcareai)


### Name: plot.thresholds_df
### Title: Plot threshold performance metrics
### Aliases: plot.thresholds_df

### ** Examples

m <- machine_learn(pima_diabetes[1:100, ], patient_id, outcome = diabetes,
                   models = "xgb", tune = FALSE, n_folds = 3)

get_thresholds(m) %>%
  plot()

get_thresholds(m, optimize = "cost", measures = c("acc", "cost"), cost_fn = 3) %>%
  plot(point_size = .5, ncol = 1)



