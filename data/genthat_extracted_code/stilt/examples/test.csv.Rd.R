library(stilt)


### Name: test.csv
### Title: To cross-validate a Gaussian Process emulator
### Aliases: test.csv

### ** Examples

# Test the 1D emulator by withholding the second parameter
# setting, and then predicting at the withheld run
data(emul.1D)
test.1D <- test.csv(final.emul=emul.1D, num.test=1, plot.std=FALSE,
                    test.runind=2, make.plot=FALSE)

# Create a custom plot
plot.default(NA, xlim=range(emul.1D$t.vec), ylim=range(test.1D$model.out.test),
             xlab="Year", ylab="Sample Output", main="Emulator Test at Theta=1",
             cex.lab=1.3, cex.axis=1.3, cex.main=1.3)
lines(emul.1D$t.vec, test.1D$model.out.test, lwd=4, lty=2, col="green")
# The emulator prediction is close to perfect! Yay!
lines(emul.1D$t.vec, test.1D$emul.out.test, lwd=2, col="yellow")

# Produce a legend
model.max <- max(test.1D$model.out.test)
# We already know that time ranges from 0 to 10 so figuring out x placement
# for the legend is not hard
legend(1, model.max, c("Model Output", "Emulator Predictions"),
       col=c("green", "yellow"), lty=c(2,1), lwd=c(4,2), cex=1.3)



# Test SICOPOLIS emulator at three pre-selected parameter settings
# specified by theseed=1234321
data(emul.Sicopolis)
# Plot the standard deviation in all three cases
test.csv(final.emul=emul.Sicopolis, num.test=3, plot.std=TRUE, theseed=1234321,
         make.plot=TRUE)



