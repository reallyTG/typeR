library(BayesCombo)


### Name: pph
### Title: Calculates the posterior probability of hypotheses for one study
### Aliases: pph

### ** Examples

# library(labstats) # need to install from CRAN
# plot(time.immob ~ dose, data=fluoxetine) 
# summary(lm(time.immob ~ dose, data=fluoxetine))
x <- pph(beta=-0.25200, se.beta=0.09913) # dose effect from above output
x



