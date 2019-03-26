library(yardstick)


### Name: detection_prevalence
### Title: Detection prevalence
### Aliases: detection_prevalence detection_prevalence.data.frame
###   detection_prevalence_vec

### ** Examples

# Two class
data("two_class_example")
detection_prevalence(two_class_example, truth, predicted)

# Multiclass
library(dplyr)
data(hpc_cv)

hpc_cv %>%
  filter(Resample == "Fold01") %>%
  detection_prevalence(obs, pred)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  detection_prevalence(obs, pred)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  detection_prevalence(obs, pred, estimator = "macro_weighted")

# Vector version
detection_prevalence_vec(two_class_example$truth, two_class_example$predicted)

# Making Class2 the "relevant" level
options(yardstick.event_first = FALSE)
detection_prevalence_vec(two_class_example$truth, two_class_example$predicted)
options(yardstick.event_first = TRUE)




