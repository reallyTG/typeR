library(healthcareai)


### Name: get_thresholds
### Title: Get class-separating thresholds for classification predictions
### Aliases: get_thresholds

### ** Examples

library(dplyr)
models <- machine_learn(pima_diabetes[1:15, ], patient_id, outcome = diabetes,
                        models = "xgb", tune = FALSE)
get_thresholds(models)

# Identify the threshold that maximizes accuracy:
get_thresholds(models, optimize = "acc")

# Assert that one missed detection is as bad as five false alarms and
# filter to the threshold that minimizes "cost" based on that assertion:
get_thresholds(models, optimize = "cost", cost_fn = 5) %>%
  filter(optimal)

# Use that threshold to make class predictions
(class_preds <- predict(models, outcome_groups = 5))
attr(class_preds$predicted_group, "cutpoints")

# Plot performance on all measures across threshold values
get_thresholds(models) %>%
  plot()

# If a measure is provided to optimize, the best threshold will be highlighted in plots
get_thresholds(models, optimize = "acc") %>%
  plot()

## Transform probability predictions into classes based on an optimal threshold ##
# Pull the threshold that minimizes cost
optimal_threshold <-
  get_thresholds(models, optimize = "cost") %>%
  filter(optimal) %>%
  pull(threshold)

# Add a Y/N column to predictions based on whether the predicted probability
# is greater than the threshold
class_predictions <-
  predict(models) %>%
  mutate(predicted_class_diabetes = case_when(
    predicted_diabetes > optimal_threshold ~ "Y",
    predicted_diabetes <= optimal_threshold ~ "N"
  ))

class_predictions %>%
  select_at(vars(ends_with("diabetes"))) %>%
  arrange(predicted_diabetes)

# Examine the expected volume of false-and-true negatives-and-positive
table(Actual = class_predictions$diabetes,
      Predicted = class_predictions$predicted_class_diabetes)



