library(merTools)


### Name: expectedRank
### Title: Calculate the expected rank of random coefficients that account
###   for uncertainty.
### Aliases: expectedRank

### ** Examples

#For a one-level random intercept model
require(lme4)
m1 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
(m1.er <- expectedRank(m1))

#For a one-level random intercept model with multiple random terms
require(lme4)
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
#ranked by the random slope on Days
(m2.er1 <- expectedRank(m2, term="Days"))
#ranked by the random intercept
(m2.er2 <- expectedRank(m2, term="int"))

## Not run: 
##D #For a two-level model with random intercepts
##D require(lme4)
##D m3 <- lmer(y ~ service * dept + (1|s) + (1|d), InstEval)
##D #Ranked by the random intercept on 's'
##D (m3.er1 <- expectedRank(m3, groupFctr="s", term="Intercept"))
## End(Not run)



