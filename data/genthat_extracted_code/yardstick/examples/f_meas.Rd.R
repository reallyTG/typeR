library(yardstick)


### Name: f_meas
### Title: F Measure
### Aliases: f_meas f_meas.data.frame f_meas_vec

### ** Examples

# Two class
data("two_class_example")
f_meas(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  f_meas(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  f_meas(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  f_meas(obs, pred, estimator = "macro_weighted")

# Vector version
f_meas_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
f_meas_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




