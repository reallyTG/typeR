library(car)


### Name: vif
### Title: Variance Inflation Factors
### Aliases: vif vif.default vif.merMod
### Keywords: regression

### ** Examples

vif(lm(prestige ~ income + education, data=Duncan))
vif(lm(prestige ~ income + education + type, data=Duncan))




