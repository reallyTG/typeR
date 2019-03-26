library(yardstick)


### Name: roc_auc
### Title: Area under the receiver operator curve
### Aliases: roc_auc roc_auc.data.frame roc_auc_vec

### ** Examples

# Two class
data("two_class_example")
roc_auc(two_class_example, truth, Class1)

# Multiclass
library(dplyr)
data(hpc_cv)

# You can use the col1:colN tidyselect syntax
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  roc_auc(obs, VF:L)

# Groups are respected
hpc_cv %>%
  group_by(Resample) %>%
  roc_auc(obs, VF:L)

# Weighted macro averaging
hpc_cv %>%
  group_by(Resample) %>%
  roc_auc(obs, VF:L, estimator = "macro_weighted")

# Vector version
# Supply a matrix of class probabilities
fold1 <- hpc_cv %>%
  filter(Resample == "Fold01")

roc_auc_vec(
   truth = fold1$obs,
   matrix(
     c(fold1$VF, fold1$F, fold1$M, fold1$L),
     ncol = 4
   )
)

# passing options via a list and _not_ `...`
roc_auc(two_class_example, truth = truth, Class1,
        options = list(smooth = TRUE))




