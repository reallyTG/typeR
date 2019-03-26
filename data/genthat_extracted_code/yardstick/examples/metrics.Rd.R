library(yardstick)


### Name: metrics
### Title: General Function to Estimate Performance
### Aliases: metrics metrics.data.frame

### ** Examples


# Accuracy and kappa
metrics(two_class_example, truth, predicted)

# Add on multinomal log loss and ROC AUC by specifying class prob columns
metrics(two_class_example, truth, predicted, Class1)

# Regression metrics
metrics(solubility_test, truth = solubility, estimate = prediction)

# Multiclass metrics work, but you cannot specify any averaging
# for roc_auc() besides the default, hand_till. Use the specific function
# if you need more customization
library(dplyr)

hpc_cv %>%
  group_by(Resample) %>%
  metrics(obs, pred, VF:L) %>%
  print(n = 40)




