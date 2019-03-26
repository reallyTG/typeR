library(yardstick)


### Name: spec
### Title: Specificity
### Aliases: spec spec.data.frame spec_vec

### ** Examples

# Two class
data("two_class_example")
spec(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  spec(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  spec(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  spec(obs, pred, estimator = "macro_weighted")

# Vector version
spec_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
spec_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




