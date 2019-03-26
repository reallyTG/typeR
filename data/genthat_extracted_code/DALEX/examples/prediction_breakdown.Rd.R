library(DALEX)


### Name: prediction_breakdown
### Title: Explanations for a Single Prediction
### Aliases: prediction_breakdown single_prediction

### ** Examples

library("breakDown")
new.wine <- data.frame(citric.acid = 0.35,
     sulphates = 0.6,
     alcohol = 12.5,
     pH = 3.36,
     residual.sugar = 4.8)

wine_lm_model4 <- lm(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
wine_lm_explainer4 <- explain(wine_lm_model4, data = wine, label = "model_4v")
wine_lm_predict4 <- prediction_breakdown(wine_lm_explainer4, observation = new.wine)
wine_lm_predict4
plot(wine_lm_predict4)

## Not run: 
##D library("randomForest")
##D wine_rf_model4 <- randomForest(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
##D wine_rf_explainer4 <- explain(wine_rf_model4, data = wine, label = "model_rf")
##D wine_rf_predict4 <- prediction_breakdown(wine_rf_explainer4, observation = new.wine)
##D wine_rf_predict4
##D plot(wine_rf_predict4)
##D 
##D library("gbm")
##D # create a gbm model
##D model <- gbm(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine,
##D              distribution = "gaussian",
##D              n.trees = 1000,
##D              interaction.depth = 4,
##D              shrinkage = 0.01,
##D              n.minobsinnode = 10,
##D              verbose = FALSE)
##D  # make an explainer for the model
##D  explainer_gbm <- explain(model, data = wine, predict_function =
##D          function(model, x) predict(model, x, n.trees = 1000))
##D  # create a new observation
##D  exp_sgn <- prediction_breakdown(explainer_gbm, observation = new.wine)
##D  exp_sgn
##D  plot(exp_sgn)
##D  
## End(Not run)




