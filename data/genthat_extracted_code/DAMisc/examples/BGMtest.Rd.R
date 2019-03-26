library(DAMisc)


### Name: BGMtest
### Title: Tests the five Berry, Golder and Milton (2012) Interactive
###   Hypothesis
### Aliases: BGMtest

### ** Examples

library(car)
data(Duncan)
mod <- lm(prestige ~ income*education + type, data=Duncan)
BGMtest(mod, c("income", "education"))



