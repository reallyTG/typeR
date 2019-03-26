library(ck37r)


### Name: sl_plot_roc
### Title: Plot a ROC curve from cross-validated AUC from SuperLearner
### Aliases: sl_plot_roc

### ** Examples


library(SuperLearner)
library(ck37r)

data(Boston, package = "MASS")

set.seed(1)
sl = SuperLearner(Boston$chas, subset(Boston, select = -chas),
                  family = binomial(), SL.library = c("SL.mean", "SL.glm"),
                  cvControl = list(V = 2))

sl

sl_plot_roc(sl, Y = Boston$chas)




