library(HistDAWass)


### Name: WH.regression.two.components.predict
### Title: Multiple regression analysis for histogram variables based on a
###   two component model and L2 Wasserstein distance
### Aliases: WH.regression.two.components.predict

### ** Examples

# do regression
 model.parameters=WH.regression.two.components(data = BLOOD,Yvar = 1, Xvars= c(2:3))
# do prediction
Predicted.BLOOD=WH.regression.two.components.predict(data = BLOOD[,2:3],parameters=model.parameters)



