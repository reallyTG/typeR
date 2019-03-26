library(qrjoint)


### Name: predict.qrjoint
### Title: Posterior predictive summary for quantile estimation
### Aliases: predict.qrjoint
### Keywords: programming

### ** Examples
 
## Plasma data analysis

# recoding variables
data(plasma)
plasma$Sex <- as.factor(plasma$Sex)
plasma$SmokStat <- as.factor(plasma$SmokStat)
plasma$VitUse <- 3 - plasma$VitUse
plasma$VitUse <- as.factor(plasma$VitUse)

# Model fitting with 40 posterior samples from 80 iterations (thin = 2) is for
# illustration only. For practical model fitting, increase iterations, 
# e.g. nsamp = 500, thin = 20
## Not run: 
##D fit.qrj <- qrjoint(BetaPlasma ~ Age + Sex + SmokStat + Quetelet + VitUse + Calories + 
##D         Fat + Fiber + Alcohol + Cholesterol + BetaDiet, plasma, nsamp = 40, thin = 2)
##D 
##D quants <- predict(fit.qrj)
##D matplot(fit.qrj$tau.g[fit.qrj$reg.ix], t(quants), type="l", xlab="p",
##D ylab="Quantile Function", col="lightgray", lty=1)
## End(Not run)



