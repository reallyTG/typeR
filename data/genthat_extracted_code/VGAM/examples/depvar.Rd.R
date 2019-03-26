library(VGAM)


### Name: depvar
### Title: Response Variable Extracted
### Aliases: depvar
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
fit@y        # Sample proportions (not recommended)
depvar(fit)  # Better than using fit@y; dependent variable (response)
weights(fit, type = "prior")  # Number of observations



