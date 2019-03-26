library(yardstick)


### Name: sens
### Title: Sensitivity
### Aliases: sens sens.data.frame sens_vec

### ** Examples

# Two class
data("two_class_example")
sens(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  sens(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  sens(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  sens(obs, pred, estimator = "macro_weighted")

# Vector version
sens_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
sens_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




