library(nonnest2)


### Name: icci
### Title: Information Criteria Confidence Intervals
### Aliases: icci

### ** Examples

## Not run: 
##D ## Count regression comparisons
##D require(MASS)
##D house1 <- glm(Freq ~ Infl + Type + Cont, family=poisson, data=housing)
##D house2 <- glm(Freq ~ Infl + Sat, family=poisson, data=housing)
##D 
##D ## CI for BIC
##D icci(house2, house1)
##D 
##D ## Further comparisons to hurdle, zero-inflated models
##D require(pscl)
##D bio1 <- glm(art ~ fem + mar + phd + ment, family=poisson, data=bioChemists)
##D bio2 <- hurdle(art ~ fem + mar + phd + ment, data=bioChemists)
##D bio3 <- zeroinfl(art ~ fem + mar + phd + ment, data=bioChemists)
##D icci(bio2, bio1)
##D icci(bio3, bio1)
##D icci(bio3, bio2)
##D 
##D ## Latent variable model comparisons
##D require(lavaan)
##D HS.model <- 'visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D fit1 <- cfa(HS.model, data=HolzingerSwineford1939)
##D fit2 <- cfa(HS.model, data=HolzingerSwineford1939, group="school")
##D icci(fit1, fit2)
## End(Not run)




