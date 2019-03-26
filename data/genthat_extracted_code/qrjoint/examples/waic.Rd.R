library(qrjoint)


### Name: waic
### Title: Watanabe Information Criterion
### Aliases: waic
### Keywords: programming

### ** Examples
 
# Plasma data analysis

# recoding variables
data(plasma)
plasma$Sex <- as.factor(plasma$Sex)
plasma$SmokStat <- as.factor(plasma$SmokStat)
plasma$VitUse <- 3 - plasma$VitUse
plasma$VitUse <- as.factor(plasma$VitUse)

# Model fitting with 40 posterior samples from 80 iterations (thin = 2) is for
# illustration only. For practical model fitting, increase iterations, 
# e.g. nsamp = 500, thin = 20
fit.qrj <- qrjoint(BetaPlasma ~ Age + Sex + SmokStat + Quetelet + VitUse + Calories + 
        Fat + Fiber + Alcohol + Cholesterol + BetaDiet, plasma, nsamp = 40, thin = 2)
summary(fit.qrj, more = TRUE)

# the call to summary already shows the waic for the fitted model, it also returns 
# the observation level log-likelihood vales. To calculate waic from last 20 draws 
# we can use:

## Not run: 
##D summary(fit.qrj, more = TRUE)
##D ll <- sm$ll
##D waic(ll[,21:40])
## End(Not run)



