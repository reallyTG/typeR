library(DALEX)


### Name: plot.model_performance_explainer
### Title: Model Performance Plots
### Aliases: plot.model_performance_explainer

### ** Examples

 ## Not run: 
##D library("breakDown")
##D library("randomForest")
##D HR_rf_model <- randomForest(left~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data, y = HR_data$left)
##D mp_rf <- model_performance(explainer_rf)
##D plot(mp_rf)
##D plot(mp_rf, geom = "boxplot", show_outliers = 1)
##D 
##D HR_glm_model <- glm(left~., data = breakDown::HR_data, family = "binomial")
##D explainer_glm <- explain(HR_glm_model, data = HR_data, y = HR_data$left, label = "glm",
##D                     predict_function = function(m,x) predict.glm(m,x,type = "response"))
##D mp_glm <- model_performance(explainer_glm)
##D plot(mp_glm)
##D 
##D HR_lm_model <- lm(left~., data = breakDown::HR_data)
##D explainer_lm <- explain(HR_lm_model, data = HR_data, y = HR_data$left)
##D mp_lm <- model_performance(explainer_lm)
##D plot(mp_lm)
##D 
##D plot(mp_rf, mp_glm, mp_lm)
##D plot(mp_rf, mp_glm, mp_lm, geom = "boxplot")
##D plot(mp_rf, mp_glm, mp_lm, geom = "boxplot", show_outliers = 1)
##D  
## End(Not run)




