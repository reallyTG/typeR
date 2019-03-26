library(HistDAWass)


### Name: WH.regression.GOF
### Title: Goodness of Fit indices for Multiple regression of histogram
###   variables based on a two component model and L2 Wasserstein distance
### Aliases: WH.regression.GOF

### ** Examples

# do regression
 model.parameters=WH.regression.two.components(data = BLOOD,Yvar = 1, Xvars= c(2:3))
 #' # do prediction
Predicted.BLOOD=WH.regression.two.components.predict(data = BLOOD[,2:3],parameters=model.parameters)
# compute GOF indices
GOF.indices=WH.regression.GOF(observed=BLOOD[,1], predicted=Predicted.BLOOD)



