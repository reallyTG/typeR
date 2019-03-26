library(tsDyn)


### Name: predict.nlar
### Title: Predict method for objects of class "nlar".
### Aliases: predict.nlar predict
### Keywords: regression

### ** Examples



x.train <- window(log10(lynx), end = 1924)
x.test <- window(log10(lynx), start = 1925)


### Use different forecasting methods:
mod.set <- setar(x.train, m=2, thDelay=0)
pred_setar_naive <- predict(mod.set, n.ahead=10)
pred_setar_boot <- predict(mod.set, n.ahead=10, type="bootstrap", n.boot=200)
pred_setar_Bboot <- predict(mod.set, n.ahead=10, type="block-bootstrap", n.boot=200)
pred_setar_MC <- predict(mod.set, n.ahead=10, type="bootstrap", n.boot=200)

## Plot to compare results:
pred_range <- range(pred_setar_naive, pred_setar_boot$pred, pred_setar_MC$pred, na.rm=TRUE)
plot(x.test, ylim=pred_range, main="Comparison of forecasts methods from same SETAR")
lines(pred_setar_naive, lty=2, col=2)
lines(pred_setar_boot$pred, lty=3, col=3)
lines(pred_setar_Bboot$pred, lty=4, col=4)
lines(pred_setar_MC$pred, lty=5, col=5)

legLabels <- c("Observed", "Naive F", "Bootstrap F","Block-Bootstrap F", "MC F")
legend("bottomleft", leg=legLabels, lty=1:5, col=1:5)




