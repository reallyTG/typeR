library(stilt)


### Name: predict.emul
### Title: Predict Method for an Emulator
### Aliases: predict.emul predict

### ** Examples

# Predict using the SICOPOLIS model at a mid-range parameter setting, and plot
# the prediction and associated uncertainty
data(emul.Sicopolis)
pred <- predict(emul.Sicopolis, c(3, 10, 50, 3, 12.5))
plot.default(NA, xlim=range(emul.Sicopolis$t.vec),
     ylim=range(pred$mean), xlab="Year",
     ylab="Ice Mass Loss relative to year 2003")
lines(emul.Sicopolis$t.vec, pred$mean, col="brown", lwd=3)
std <- sqrt(diag(pred$covariance))
lines(emul.Sicopolis$t.vec, pred$mean + std, col="brown", lty=2)
lines(emul.Sicopolis$t.vec, pred$mean - std, col="brown", lty=2)


# Fit an emulator to the 1-parameter test ensemble data, predict at
# Theta*=8, and plot the prediction
data(Data.1D.par)
data(Data.1D.model)
emul.1D <- emulator(Data.1D.par, Data.1D.model, TRUE, TRUE, 100, 0.1)
pred.1D <- predict(emul.1D, 8)
plot(emul.1D$t.vec, pred.1D$mean, xlab="Year",
     ylab="Sample Model Output at Theta*=8")



