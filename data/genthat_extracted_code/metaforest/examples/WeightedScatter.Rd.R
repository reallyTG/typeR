library(metaforest)


### Name: WeightedScatter
### Title: Plots weighted scatterplots for meta-analytic data. Can plot
###   effect size as a function of either continuous (numeric, integer) or
###   categorical (factor, character) predictors.
### Aliases: WeightedScatter

### ** Examples

set.seed(42)
data <- SimulateSMD(k_train = 100, model = es * x[, 1] + es * x[, 2] + es *
                      x[, 1] * x[, 2])$training
data$X2 <- cut(data$X2, breaks = 2, labels = c("Low", "High"))
data$X3 <- cut(data$X3, breaks = 2, labels = c("Small", "Big"))
WeightedScatter(data, summarize = FALSE)
WeightedScatter(data, vars = c("X3"))
WeightedScatter(data, vars = c("X1", "X3"))
WeightedScatter(data, tau2 = .04)



