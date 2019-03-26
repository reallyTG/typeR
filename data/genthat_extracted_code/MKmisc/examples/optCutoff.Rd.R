library(MKmisc)


### Name: optCutoff
### Title: Compute the Optimal Cutoff for Binary Classification
### Aliases: optCutoff
### Keywords: univar

### ** Examples

## example from dataset infert
fit <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
pred <- predict(fit, type = "response")
optCutoff(pred, truth = infert$case, namePos = 1)
optCutoff(pred, truth = infert$case, namePos = 1,
          perfMeasure = "balanced Brier score", max = FALSE)
optCutoff(pred, truth = infert$case, namePos = 1,
          perfMeasure = "area under the ROC curve (AUC)")



