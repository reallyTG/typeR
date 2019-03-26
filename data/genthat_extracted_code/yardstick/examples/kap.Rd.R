library(yardstick)


### Name: kap
### Title: Kappa
### Aliases: kap kap.data.frame kap_vec

### ** Examples

# Two class
data("two_class_example")
kap(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  kap(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  kap(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  kap(obs, pred, estimator = "macro_weighted")

# Vector version
kap_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
kap_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




