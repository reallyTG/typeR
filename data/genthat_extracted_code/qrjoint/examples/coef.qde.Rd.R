library(qrjoint)


### Name: coef.qde
### Title: Coefficient Extraction from qde Model Fit
### Aliases: coef.qde
### Keywords: programming

### ** Examples

## Plasma data analysis
data(plasma)
Y <- plasma$BetaPlasma
Y <- Y + 0.1 * rnorm(length(Y)) ## remove atomicity

# model fitting with 50 posterior samples from 100 iterations (thin = 2)
fit.qde <- qde(Y, 50, 2)
betas <- coef(fit.qde)
signif(betas$parametric, 3)



