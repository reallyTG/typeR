library(dLagM)


### Name: sortScore
### Title: Sort ACI, BIC and MASE scores
### Aliases: sortScore

### ** Examples

data(warming)
model.poly1 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                     q = 2 , k = 2 , show.beta = TRUE)
model.poly2 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                      q = 3 , k = 2 , show.beta = TRUE)
model.poly3 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                      q = 4 , k = 2 , show.beta = TRUE)

aic = AIC(model.poly1$model, model.poly2$model, model.poly3$model)
bic = BIC(model.poly1$model, model.poly2$model, model.poly3$model)
mase = MASE(model.poly1$model, model.poly2$model, model.poly3$model)

sortScore(aic , score = "aic")
sortScore(bic , score = "bic")
sortScore(mase , score = "mase")




