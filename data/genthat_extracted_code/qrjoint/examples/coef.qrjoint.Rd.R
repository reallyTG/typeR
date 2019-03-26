library(qrjoint)


### Name: coef.qrjoint
### Title: Regression Coefficient Extraction from qrjoint Model Fit
### Aliases: coef.qrjoint
### Keywords: programming

### ** Examples
 
## Plasma data analysis

# recoding variables
data(plasma)
plasma$Sex <- as.factor(plasma$Sex)
plasma$SmokStat <- as.factor(plasma$SmokStat)
plasma$VitUse <- 3 - plasma$VitUse
plasma$VitUse <- as.factor(plasma$VitUse)

# model fitting with 50 posterior samples from 100 iterations (thin = 2)
fit.qrj <- qrjoint(BetaPlasma ~ Age + Sex + SmokStat + Quetelet + VitUse + Calories + 
        Fat + Fiber + Alcohol + Cholesterol + BetaDiet, plasma, nsamp = 40, thin = 2)

## Not run: 
##D betas <- coef(fit.qrj) ## no plots
##D betas <- coef(fit.qrj, plot = TRUE) ## estimates are plotted
## End(Not run)



