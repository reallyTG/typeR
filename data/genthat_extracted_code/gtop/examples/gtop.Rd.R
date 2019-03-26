library(gtop)


### Name: gtop
### Title: Reconciliate individual predictions using GTOP
### Aliases: gtop

### ** Examples

K <- 5
indiv <- rep(0, K)
total <- 1
gtop(preds_indiv   = indiv,
     pred_total = total,
     weights_indiv = rep(1, K),
     weight_total = 2,
     bounds_indiv  = rep(1 / K, K))



