library(mldr)


### Name: Averaged metrics
### Title: Multi-label averaged evaluation metrics
### Aliases: 'Averaged metrics' accuracy precision micro_precision
###   macro_precision recall micro_recall macro_recall fmeasure
###   micro_fmeasure macro_fmeasure

### ** Examples

true_labels <- matrix(c(
1,1,1,
0,0,0,
1,0,0,
1,1,1,
0,0,0,
1,0,0
), ncol = 3, byrow = TRUE)
predicted_labels <- matrix(c(
1,1,1,
0,0,0,
1,0,0,
1,1,0,
1,0,0,
0,1,0
), ncol = 3, byrow = TRUE)

precision(true_labels, predicted_labels, undefined_value = "diagnose")
macro_recall(true_labels, predicted_labels, undefined_value = 0)
macro_fmeasure(
  true_labels, predicted_labels,
  undefined_value = function(tp, fp, tn, fn) as.numeric(fp == 0 && fn == 0)
)



