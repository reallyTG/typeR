library(cutpointr)


### Name: plot_cutpointr
### Title: General purpose plotting function for cutpointr or roc_cutpointr
###   objects
### Aliases: plot_cutpointr

### ** Examples

set.seed(1)
oc <- cutpointr(suicide, dsi, suicide, boot_runs = 10)

plot_cutpointr(oc, cutpoint, F1_score)

## ROC curve
plot_cutpointr(oc, fpr, tpr, aspect_ratio = 1)

## Custom function
plot_cutpointr(oc, cutpoint, function(tp, tn, fp, fn, ...) tp / fp) +
  ggplot2::ggtitle("Custom metric") + ggplot2::ylab("value")




