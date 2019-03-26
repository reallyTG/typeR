library(yardstick)


### Name: mcc
### Title: Matthews correlation coefficient
### Aliases: mcc mcc.data.frame mcc_vec

### ** Examples

# Two class
data("two_class_example")
mcc(two_class_example, truth, predicted)

# Multiclass
# mcc() has a natural multiclass extension
library(dplyr)
data(hpc_cv)
hpc_cv %>%
  group_by(Resample) %>%
  mcc(obs, pred)




