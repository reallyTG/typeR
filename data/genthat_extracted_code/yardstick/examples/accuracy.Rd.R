library(yardstick)


### Name: accuracy
### Title: Accuracy
### Aliases: accuracy accuracy.data.frame accuracy_vec

### ** Examples

# Two class
data("two_class_example")
accuracy(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  accuracy(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  accuracy(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  accuracy(obs, pred, estimator = "macro_weighted")

# Vector version
accuracy_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
accuracy_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




