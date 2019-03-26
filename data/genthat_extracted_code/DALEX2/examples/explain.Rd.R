library(DALEX2)


### Name: explain.default
### Title: Create Model Explainer
### Aliases: explain.default explain

### ** Examples

apartments_lm <- lm(m2.price ~ ., data = apartments)
apartments_lm_ex <- explain(apartments_lm, data = apartments, label = "apartments_lm")
apartments_lm_ex

 ## Not run: 
##D library("breakDown2")
##D wine_lm_model4 <- lm(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
##D wine_lm_explainer4 <- explain(wine_lm_model4, data = wine, label = "model_4v")
##D wine_lm_explainer4
##D 
##D library("randomForest")
##D wine_rf_model4 <- randomForest(quality ~ pH + residual.sugar + sulphates + alcohol, data = wine)
##D wine_rf_explainer4 <- explain(wine_rf_model4, data = wine, label = "model_rf")
##D wine_rf_explainer4
##D  
## End(Not run)




