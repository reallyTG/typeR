library(drc)


### Name: predict.drc
### Title: Prediction
### Aliases: predict.drc predict.mrdrc
### Keywords: models nonlinear

### ** Examples


## Fitting a model
spinach.model1 <- drm(SLOPE~DOSE, CURVE, data = spinach, fct = LL.4())

## Predicting values a dose=2 (with standard errors)
predict(spinach.model1, data.frame(dose=2, CURVE=c("1", "2", "3")), se.fit = TRUE)

## Getting confidence intervals
predict(spinach.model1, data.frame(dose=2, CURVE=c("1", "2", "3")), 
interval = "confidence")

## Getting prediction intervals
predict(spinach.model1, data.frame(dose=2, CURVE=c("1", "2", "3")), 
interval = "prediction")




