library(nonnest2)


### Name: vuongtest
### Title: Vuong Tests for Model Comparison
### Aliases: vuongtest

### ** Examples

## Not run: 
##D ## Count regression comparisons
##D require(MASS)
##D house1 <- glm(Freq ~ Infl + Type + Cont, family=poisson, data=housing)
##D house2 <- glm(Freq ~ Infl + Sat, family=poisson, data=housing)
##D house3 <- glm(Freq ~ Infl, family=poisson, data=housing)
##D ## house3 is nested within house1 and house2
##D anova(house3, house1, test="Chisq")
##D anova(house3, house2, test="Chisq")
##D 
##D ## house 2 is not nested in house1, so this test is invalid
##D anova(house2, house1, test="Chisq")
##D 
##D ## Use vuongtest() instead
##D vuongtest(house2, house1)
##D 
##D ## Application to models with different distributional assumptions
##D require(pscl)
##D bio1 <- glm(art ~ fem + mar + phd + ment, family=poisson, data=bioChemists)
##D bio2 <- hurdle(art ~ fem + mar + phd + ment, data=bioChemists)
##D bio3 <- zeroinfl(art ~ fem + mar + phd + ment, data=bioChemists)
##D vuongtest(bio2, bio1)
##D vuongtest(bio3, bio1)
##D vuongtest(bio1, bio2)
##D vuongtest(bio1, bio3)
##D vuongtest(bio3, bio2)
##D 
##D ## Application to latent variable models
##D require(lavaan)
##D HS.model <- 'visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D fit1 <- cfa(HS.model, data=HolzingerSwineford1939)
##D fit2 <- cfa(HS.model, data=HolzingerSwineford1939, group="school")
##D vuongtest(fit1, fit2)
##D 
##D ## Supplying custom vcov function
##D require(lme4)
##D require(merDeriv)
##D 
##D fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy, REML=FALSE)
##D fm2 <- lmer(Reaction ~ Days + (Days || Subject), sleepstudy, REML=FALSE)
##D 
##D vcl <- function(obj) vcov(obj, full=TRUE)
##D vuongtest(fm1, fm2, vc1=vcl, vc2=vcl, nested=TRUE)
##D 
## End(Not run)




