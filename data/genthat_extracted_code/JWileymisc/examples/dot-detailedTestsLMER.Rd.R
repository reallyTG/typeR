library(JWileymisc)


### Name: .detailedTestsLMER
### Title: estimate detailed results per variable and effect sizes for both
###   fixed and random effects from lmer models
### Aliases: .detailedTestsLMER

### ** Examples


## Not run: 
##D data(aces_daily)
##D m1 <- lme4::lmer(NegAff ~ STRESS + (1 + STRESS | UserID),
##D   data = aces_daily)
##D m2 <- lme4::lmer(NegAff ~ STRESS + I(STRESS^2) + (1 + STRESS | UserID),
##D   data = aces_daily)
##D testm1 <- .detailedTests(m1, method = "profile")
##D testm2 <- .detailedTests(m2, method = "profile")
##D testm2b <- .detailedTests(m2, method = "boot", nsim = 100)
## End(Not run)



