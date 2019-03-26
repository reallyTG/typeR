library(DAMisc)


### Name: crTest
### Title: Test of linearity for Component + Residual Plots
### Aliases: crTest

### ** Examples

library(car)
mod <- lm(prestige ~ income + education + women, data=Prestige)
crTest(mod)



