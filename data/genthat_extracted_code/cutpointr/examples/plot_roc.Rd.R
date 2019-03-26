library(cutpointr)


### Name: plot_roc
### Title: Plot ROC curve from a cutpointr object
### Aliases: plot_roc

### ** Examples

opt_cut <- cutpointr(suicide, dsi, suicide)
plot_roc(opt_cut, display_cutpoint = FALSE)

opt_cut_2groups <- cutpointr(suicide, dsi, suicide, gender)
plot_roc(opt_cut_2groups, display_cutpoint = TRUE)



