library(DALEX)


### Name: variable_response
### Title: Marginal Response for a Single Variable
### Aliases: variable_response single_variable

### ** Examples

library("breakDown")
logit <- function(x) exp(x)/(1+exp(x))

HR_glm_model <- glm(left~., data = breakDown::HR_data, family = "binomial")
explainer_glm <- explain(HR_glm_model, data = HR_data, trans=logit)
expl_glm <- variable_response(explainer_glm, "satisfaction_level", "pdp")
expl_glm

 ## Not run: 
##D library("randomForest")
##D HR_rf_model <- randomForest(factor(left)~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data,
##D                        predict_function = function(model, x)
##D                               predict(model, x, type = "prob")[,2])
##D expl_rf  <- variable_response(explainer_rf, variable = "satisfaction_level", type = "pdp",
##D                        which.class = 2, prob = TRUE)
##D expl_rf
##D plot(expl_rf)
##D  
## End(Not run)




