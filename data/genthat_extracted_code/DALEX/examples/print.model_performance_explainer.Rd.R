library(DALEX)


### Name: print.model_performance_explainer
### Title: Model Performance Summary
### Aliases: print.model_performance_explainer

### ** Examples

 ## Not run: 
##D library("breakDown")
##D library("randomForest")
##D HR_rf_model <- randomForest(left~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data, y = HR_data$left)
##D mp_ex_rf <- model_performance(explainer_rf)
##D mp_ex_rf
##D plot(mp_ex_rf)
##D  
## End(Not run)




