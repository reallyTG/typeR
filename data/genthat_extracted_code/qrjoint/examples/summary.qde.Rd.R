library(qrjoint)


### Name: summary.qde
### Title: Summary Method for Quantile based Density Estimation
### Aliases: summary.qde
### Keywords: programming

### ** Examples
 
# Plasma data analysis

data(plasma)
Y <- plasma$BetaPlasma
Y <- Y + 0.1 * rnorm(length(Y)) ## remove atomicity

# model fitting with 50 posterior samples from 100 iterations (thin = 2)
fit.qde <- qde(Y, 50, 2)
summary(fit.qde, more = TRUE)



