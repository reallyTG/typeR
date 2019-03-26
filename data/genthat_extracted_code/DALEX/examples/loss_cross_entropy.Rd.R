library(DALEX)


### Name: loss_cross_entropy
### Title: Preimplemented Loss Functions
### Aliases: loss_cross_entropy loss_sum_of_squares loss_root_mean_square

### ** Examples

 ## Not run: 
##D library("randomForest")
##D HR_rf_model <- randomForest(status~., data = HR, ntree = 100)
##D loss_cross_entropy(HR$status, yhat(HR_rf_model))
##D  
## End(Not run)



