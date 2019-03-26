library(yardstick)


### Name: j_index
### Title: J-index
### Aliases: j_index j_index.data.frame j_index_vec

### ** Examples

# Two class
data("two_class_example")
j_index(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  j_index(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  j_index(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  j_index(obs, pred, estimator = "macro_weighted")

# Vector version
j_index_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
j_index_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




