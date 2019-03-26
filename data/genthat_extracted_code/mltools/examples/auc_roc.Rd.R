library(mltools)


### Name: auc_roc
### Title: Area Under the ROC Curve
### Aliases: auc_roc

### ** Examples

library(data.table)
preds <- c(.1, .3, .3, .9)
actuals <- c(0, 0, 1, 1)
auc_roc(preds, actuals)
auc_roc(preds, actuals, returnDT=TRUE)



