library(DALEX)


### Name: plot.variable_importance_explainer
### Title: Plots Global Model Explanations (Variable Importance)
### Aliases: plot.variable_importance_explainer

### ** Examples


 ## Not run: 
##D library("breakDown")
##D library("randomForest")
##D HR_rf_model <- randomForest(left~., data = breakDown::HR_data, ntree = 100)
##D explainer_rf  <- explain(HR_rf_model, data = HR_data, y = HR_data$left)
##D vd_rf <- variable_importance(explainer_rf, type = "raw")
##D vd_rf
##D plot(vd_rf)
##D 
##D HR_glm_model <- glm(left~., data = breakDown::HR_data, family = "binomial")
##D explainer_glm <- explain(HR_glm_model, data = HR_data, y = HR_data$left)
##D logit <- function(x) exp(x)/(1+exp(x))
##D vd_glm <- variable_importance(explainer_glm, type = "raw",
##D                         loss_function = function(observed, predicted)
##D                                    sum((observed - logit(predicted))^2))
##D vd_glm
##D plot(vd_glm)
##D 
##D library("xgboost")
##D model_martix_train <- model.matrix(left~.-1, breakDown::HR_data)
##D data_train <- xgb.DMatrix(model_martix_train, label = breakDown::HR_data$left)
##D param <- list(max_depth = 2, eta = 1, silent = 1, nthread = 2,
##D               objective = "binary:logistic", eval_metric = "auc")
##D HR_xgb_model <- xgb.train(param, data_train, nrounds = 50)
##D explainer_xgb <- explain(HR_xgb_model, data = model_martix_train,
##D                                     y = HR_data$left, label = "xgboost")
##D vd_xgb <- variable_importance(explainer_xgb, type = "raw")
##D vd_xgb
##D plot(vd_xgb)
##D 
##D plot(vd_rf, vd_glm, vd_xgb)
##D 
##D # NOTE:
##D # if you like to have all importances hooked to 0, you can do this as well
##D vd_rf <- variable_importance(explainer_rf, type = "difference")
##D vd_glm <- variable_importance(explainer_glm, type = "difference",
##D                         loss_function = function(observed, predicted)
##D                                    sum((observed - logit(predicted))^2))
##D vd_xgb <- variable_importance(explainer_xgb, type = "difference")
##D plot(vd_rf, vd_glm, vd_xgb)
##D  
## End(Not run)




