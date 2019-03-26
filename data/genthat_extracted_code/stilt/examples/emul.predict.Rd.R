library(stilt)


### Name: emul.predict
### Title: To predict using an emulator (Deprecated)
### Aliases: emul.predict

### ** Examples

## Not run: 
##D # Predict using the SICOPOLIS model at a mid-range parameter setting, and plot
##D # the prediction and associated uncertainty
##D data(emul.Sicopolis)
##D pred <- emul.predict(emul.Sicopolis, c(3, 10, 50, 3, 12.5))
##D plot.default(NA, xlim=range(emul.Sicopolis$t.vec),
##D      ylim=range(pred$mean), xlab="Year",
##D      ylab="Ice Mass Loss relative to year 2003")
##D lines(emul.Sicopolis$t.vec, pred$mean, col="brown", lwd=3)
##D std <- sqrt(diag(pred$covariance))
##D lines(emul.Sicopolis$t.vec, pred$mean + std, col="brown", lty=2)
##D lines(emul.Sicopolis$t.vec, pred$mean - std, col="brown", lty=2)
##D 
##D 
##D # Fit an emulator to the 1-parameter test ensemble data, predict at
##D # Theta*=8, and plot the prediction
##D data(Data.1D.par)
##D data(Data.1D.model)
##D emul.1D <- emulator(Data.1D.par, Data.1D.model, TRUE, TRUE, 100, 0.1)
##D pred.1D <- emul.predict(emul.1D, 8)
##D plot(emul.1D$t.vec, pred.1D$mean, xlab="Year",
##D      ylab="Sample Model Output at Theta*=8")
## End(Not run)



