library(LoopAnalyst)


### Name: weighted.predictions
### Title: Compute the Matrix of Weighted Predictions
### Aliases: weighted.predictions
### Keywords: graphs

### ** Examples

## compute community effect matrix, and note high prevalence of ambiguous predictions
data(cm.dambacher)
make.cem(cm.dambacher, out=TRUE)
## compute weighted prediction matrix, and note disambiguation of the cem
weighted.predictions(t(cm.dambacher))



