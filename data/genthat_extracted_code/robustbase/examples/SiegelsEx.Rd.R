library(robustbase)


### Name: SiegelsEx
### Title: Siegel's Exact Fit Example Data
### Aliases: SiegelsEx
### Keywords: datasets

### ** Examples

data(SiegelsEx)
plot(SiegelsEx, main = "Siegel's example for 'exact fit'")
abline(          lm(y ~ x, data = SiegelsEx))
abline(MASS::lqs(y ~ x, data = SiegelsEx, method = "lms"), col = 2)
legend("topright", leg = c("lm", "LMS"), col=1:2, lwd=1, inset = 1/20)



