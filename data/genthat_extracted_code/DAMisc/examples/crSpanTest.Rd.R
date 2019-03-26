library(DAMisc)


### Name: crSpanTest
### Title: Test of Span Parameter in linearity for Component + Residual
###   Plots
### Aliases: crSpanTest

### ** Examples

library(car)
mod <- lm(prestige ~ income + education + women, data=Prestige)
tmp <- crSpanTest(mod, c(.1, .9), adjust.method="holm", 
	adjust.type="both")
matplot(tmp$x, tmp$y, type="l")



