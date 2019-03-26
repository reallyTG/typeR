library(DALEX)


### Name: explain.default
### Title: Create Model Explainer
### Aliases: explain.default explain

### ** Examples

library("breakDown")

wine_lm_model4 <- lm(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
wine_lm_explainer4 <- explain(wine_lm_model4, data = wine, label = "model_4v")
wine_lm_explainer4

 ## Not run: 
##D library("randomForest")
##D wine_rf_model4 <- randomForest(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
##D wine_rf_explainer4 <- explain(wine_rf_model4, data = wine, label = "model_rf")
##D wine_rf_explainer4
##D  
## End(Not run)




