library(yardstick)


### Name: precision
### Title: Precision
### Aliases: precision precision.data.frame precision_vec

### ** Examples

# Two class
data("two_class_example")
precision(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  precision(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  precision(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  precision(obs, pred, estimator = "macro_weighted")

# Vector version
precision_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
precision_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




