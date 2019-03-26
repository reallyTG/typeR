library(yardstick)


### Name: bal_accuracy
### Title: Balanced accuracy
### Aliases: bal_accuracy bal_accuracy.data.frame bal_accuracy_vec

### ** Examples

# Two class
data("two_class_example")
bal_accuracy(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  bal_accuracy(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  bal_accuracy(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  bal_accuracy(obs, pred, estimator = "macro_weighted")

# Vector version
bal_accuracy_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
bal_accuracy_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




