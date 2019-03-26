library(merTools)


### Name: REimpact
### Title: Calculate the weighted mean of fitted values for various levels
###   of random effect terms.
### Aliases: REimpact

### ** Examples

#For a one-level random intercept model
require(lme4)
m1 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
(m1.er <- REimpact(m1, newdata = sleepstudy[1, ], breaks = 2))

#For a one-level random intercept model with multiple random terms
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
#ranked by the random slope on Days
(m2.er1 <- REimpact(m2,  newdata = sleepstudy[1, ],
           groupFctr = "Subject", term="Days"))
#ranked by the random intercept
(m2.er2 <- REimpact(m2, newdata = sleepstudy[1, ],
             groupFctr = "Subject", term="int"))
## Not run: 
##D # You can also pass additional arguments to predictInterval through REimpact
##D g1 <- lmer(y ~ lectage + studage + (1|d) + (1|s), data=InstEval)
##D zed <- REimpact(g1, newdata = InstEval[9:12, ], groupFctr = "d", n.sims = 50,
##D                 include.resid.var = TRUE)
##D zed2 <- REimpact(g1, newdata = InstEval[9:12, ], groupFctr = "s", n.sims = 50,
##D                  include.resid.var = TRUE)
##D zed3 <- REimpact(g1, newdata = InstEval[9:12, ], groupFctr = "d", breaks = 5,
## End(Not run)




