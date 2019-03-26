library(MLInterfaces)


### Name: performance-analytics
### Title: Assessing classifier performance
### Aliases: precision-methods precision,classifierOutput,character-method
###   precision,classifierOutput,missing-method
###   precision,classifierOutput,numeric-method
###   precision,table,missing-method precision recall-methods
###   recall,classifierOutput,character-method
###   recall,classifierOutput,missing-method
###   recall,classifierOutput,numeric-method recall,table,missing-method
###   recall sensitivity-methods
###   sensitivity,classifierOutput,character-method
###   sensitivity,classifierOutput,missing-method
###   sensitivity,classifierOutput,numeric-method
###   sensitivity,table,missing-method sensitivity macroF1-methods
###   macroF1,classifierOutput,character-method
###   macroF1,classifierOutput,missing-method
###   macroF1,classifierOutput,numeric-method macroF1,table,missing-method
###   macroF1,numeric,numeric-method macroF1 acc,table-method acc
###   specificity,table-method specificity tp,table-method tp
###   tn,table-method tn fp,table-method fp fn,table-method fn
###   F1,table-method F1
### Keywords: methods

### ** Examples

## the confusion matrix
cm <- table(iris$Species, sample(iris$Species))
tp(cm)
tn(cm)
fp(cm)
fn(cm)
acc(cm)
precision(cm)
recall(cm)
F1(cm)
macroF1(cm)



