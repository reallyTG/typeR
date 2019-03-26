library(DALEX)


### Name: plot.variable_response_explainer
### Title: Plots Marginal Model Explanations (Single Variable Responses)
### Aliases: plot.variable_response_explainer

### ** Examples

library("breakDown")
logit <- function(x) exp(x)/(1+exp(x))

HR_glm_model <- glm(left~., data = breakDown::HR_data, family = "binomial")
explainer_glm <- explain(HR_glm_model, data = HR_data, trans = logit)
expl_glm <- variable_response(explainer_glm, "satisfaction_level", "pdp", trans=logit)
plot(expl_glm)

 ## Not run: 
##D library("randomForest")
##D HR_rf_model <- randomForest(factor(left)~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data,
##D                        predict_function = function(model, x)
##D                              predict(model, x, type = "prob")[,2])
##D expl_rf  <- variable_response(explainer_rf, variable = "satisfaction_level",
##D                        type = "pdp", which.class = 2, prob = TRUE)
##D plot(expl_rf)
##D 
##D plot(expl_rf, expl_glm)
##D 
##D # Example for factor variable (with factorMerger)
##D library("randomForest")
##D expl_rf  <- variable_response(explainer_rf, variable =  "sales", type = "factor")
##D plot(expl_rf)
##D 
##D expl_glm  <- variable_response(explainer_glm, variable =  "sales", type = "factor")
##D plot(expl_glm)
##D 
##D # both models
##D plot(expl_rf, expl_glm)
##D  
## End(Not run)




