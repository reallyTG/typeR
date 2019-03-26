library(psycho)


### Name: find_best_model.lavaan
### Title: Returns all combinations of lavaan models with their indices of
###   fit.
### Aliases: find_best_model.lavaan

### ** Examples

library(psycho)
library(lavaan)

model <- " visual  =~ x1 + x2 + x3
textual =~ x4 + x5 + x6
speed   =~ x7 + x8 + x9
visual ~ textual
textual ~ speed"
fit <- lavaan::sem(model, data = HolzingerSwineford1939)

models <- find_best_model(fit, latent = "visual  =~ x1 + x2 + x3
textual =~ x4 + x5 + x6
speed   =~ x7 + x8 + x9")



