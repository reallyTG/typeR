library(JWileymisc)


### Name: R2LMER
### Title: Calculates the R2 from lmer models
### Aliases: R2LMER
### Keywords: utils

### ** Examples


## Not run: 
##D data(aces_daily)
##D m1 <- lme4::lmer(NegAff ~ STRESS + (1 + STRESS | UserID),
##D   data = aces_daily)
##D 
##D R2LMER(m1, summary(m2))
##D 
##D rm(m1)
## End(Not run)



