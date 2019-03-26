library(ENMeval)


### Name: var.importance
### Title: Extract percent contribution and permutation importance from a
###   Maxent model
### Aliases: var.importance

### ** Examples

data(enmeval_results)

# Select model with lowest AICc

aic.mod <- enmeval_results@models[[which(enmeval_results@results$delta.AICc==0)]]
var.importance(aic.mod)

# See the variable importance metrics for the first 3 models

lapply(enmeval_results@models, var.importance)[1:3]



