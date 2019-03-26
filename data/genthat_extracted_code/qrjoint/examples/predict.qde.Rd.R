library(qrjoint)


### Name: predict.qde
### Title: Posterior predictive summary for quantile-based density
###   estimation
### Aliases: predict.qde
### Keywords: programming

### ** Examples
 
# Plasma data analysis

data(plasma)
Y <- plasma$BetaPlasma
Y <- Y + 0.1 * rnorm(length(Y)) ## remove atomicity

# model fitting with 50 posterior samples from 100 iterations (thin = 2)
fit.qde <- qde(Y, 50, 2)
pred <- predict(fit.qde)
hist(Y, freq = FALSE, col = "gray", border = "white", ylim = c(0, max(pred$fest)))
matplot(pred$y, pred$fest, type="l", col=1, lty=c(2,1,2), ylab="Density", xlab="y")



