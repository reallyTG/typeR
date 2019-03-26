library(qrjoint)


### Name: qde
### Title: Quantiles based Density Estimation
### Aliases: qde update.qde
### Keywords: programming

### ** Examples

## Plasma data analysis

data(plasma)
Y <- plasma$BetaPlasma

# model fitting with 100 posterior samples from 200 iterations (thin = 2)
# this is of course for illustration, for practical model fitting you
# ought to try at least something like nsamp = 500, thin = 20
fit.qde <- qde(Y, nsamp = 100, thin = 2)
summary(fit.qde, more = TRUE)
pred <- predict(fit.qde)
hist(Y, freq = FALSE, col = "gray", border = "white", ylim = c(0, max(pred$fest)))
lines(pred$y, pred$fest[,2])
lines(pred$y, pred$fest[,1], lty = 2)
lines(pred$y, pred$fest[,3], lty = 2)



