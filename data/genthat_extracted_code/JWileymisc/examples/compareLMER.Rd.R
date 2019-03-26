library(JWileymisc)


### Name: compareLMER
### Title: Compare two lmer models
### Aliases: compareLMER
### Keywords: utils

### ** Examples


## Not run: 
##D data(aces_daily)
##D m1 <- lme4::lmer(NegAff ~ STRESS + (1 + STRESS | UserID),
##D   data = aces_daily)
##D m2 <- lme4::lmer(NegAff ~ STRESS + (1 | UserID),
##D   data = aces_daily)
##D 
##D compareLMER(m1, m2)
##D 
##D rm(m1, m2)
## End(Not run)



