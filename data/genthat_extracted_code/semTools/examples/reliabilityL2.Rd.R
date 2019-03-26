library(semTools)


### Name: reliabilityL2
### Title: Calculate the reliability values of a second-order factor
### Aliases: reliabilityL2

### ** Examples


library(lavaan)

HS.model3 <- ' visual  =~ x1 + x2 + x3
               textual =~ x4 + x5 + x6
               speed   =~ x7 + x8 + x9
			          higher =~ visual + textual + speed'

fit6 <- cfa(HS.model3, data = HolzingerSwineford1939)
reliability(fit6) # Should provide a warning for the endogenous variables
reliabilityL2(fit6, "higher")




