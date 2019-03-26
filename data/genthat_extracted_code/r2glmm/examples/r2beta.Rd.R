library(r2glmm)


### Name: r2beta
### Title: r2beta Compute R Squared for Mixed Models
### Aliases: r2beta

### ** Examples

library(nlme)
library(lme4)
data(Orthodont)

# Linear mixed models
mermod = lmer(distance ~ age*Sex + (1|Subject), data = Orthodont)
lmemod = lme(distance ~ age*Sex, random = ~1|Subject, data = Orthodont)

# The Kenward-Roger approach
r2beta(mermod, method = 'kr')

# Standardized Generalized Variance
r2beta(mermod, method = 'sgv')
r2beta(lmemod, method = 'sgv')

# The marginal R squared by Nakagawa and Schielzeth (extended by Johnson)
r2beta(mermod, method = 'nsj')

# linear and generalized linear models

library(datasets)
dis = data.frame(discoveries)
dis$year = 1:nrow(dis)

lmod = lm(discoveries ~ year + I(year^2), data = dis)
glmod = glm(discoveries ~ year + I(year^2), family = 'poisson', data = dis)

# Using an inappropriate link function (normal) leads to
# a poor fit relative to the poisson link function.

r2beta(lmod)
r2beta(glmod)

# PQL models
# Currently only SGV method is supported
library(MASS)
PQL_bac = glmmPQL(y ~ trt + I(week > 2), random = ~ 1 | ID,
                  family = binomial, data = bacteria,
                  verbose = FALSE)

r2beta(PQL_bac, method='sgv')




