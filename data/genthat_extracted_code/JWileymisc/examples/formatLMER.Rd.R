library(JWileymisc)


### Name: formatLMER
### Title: Format results from a linear mixed model
### Aliases: formatLMER
### Keywords: misc

### ** Examples


## Not run: 
##D data(sleepstudy)
##D m1 <- lme4::lmer(Reaction ~ Days + (1 + Days | Subject),
##D   data = sleepstudy)
##D m2 <- lme4::lmer(Reaction ~ Days + I(Days^2) + (1 + Days | Subject),
##D   data = sleepstudy)
##D 
##D testm1 <- detailedTests(m1, method = "profile")
##D testm2 <- detailedTests(m2, method = "profile")
##D formatLMER(list(testm1, testm2))
##D formatLMER(list(testm1, testm2),
##D   format = list(
##D     FixedEffects = "%s, %s (%s, %s)",
##D     RandomEffects = c("%s", "%s (%s, %s)"),
##D     EffectSizes = "%s, %s; %s"),
##D   pcontrol = list(digits = 3, stars = FALSE,
##D                   includeP = TRUE, includeSign = TRUE,
##D                   dropLeadingZero = TRUE))
## End(Not run)



