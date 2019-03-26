library(DALEX)


### Name: model_performance
### Title: Model Performance Plots
### Aliases: model_performance

### ** Examples

 ## Not run: 
##D library("breakDown")
##D library("randomForest")
##D HR_rf_model <- randomForest(left~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data, y = HR_data$left)
##D model_performance(explainer_rf)
##D 
##D HR_glm_model <- glm(left~., data = breakDown::HR_data, family = "binomial")
##D explainer_glm <- explain(HR_glm_model, data = HR_data, y = HR_data$left,
##D                     predict_function = function(m,x) predict.glm(m,x,type = "response"))
##D mp_ex_glm <- model_performance(explainer_glm)
##D mp_ex_glm
##D plot(mp_ex_glm)
##D 
##D HR_lm_model <- lm(left~., data = breakDown::HR_data)
##D explainer_lm <- explain(HR_lm_model, data = HR_data, y = HR_data$left)
##D model_performance(explainer_lm)
##D  
## End(Not run)




