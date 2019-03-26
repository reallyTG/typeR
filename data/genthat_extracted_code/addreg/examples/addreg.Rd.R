library(addreg)


### Name: addreg
### Title: Additive Regression for Discrete Data
### Aliases: addreg
### Keywords: models regression

### ** Examples

require(glm2)
data(crabs)

#============================================================================
#  identity-link Poisson model with periodic non-convergence when glm is used
#============================================================================

crabs.boot <- crabs[crabs$Rep1,-c(5:6)]
crabs.boot$width.shifted <- crabs.boot$Width - min(crabs$Width)

fit.glm <- glm(Satellites ~ width.shifted + factor(Dark) + factor(GoodSpine),
  family = poisson(identity), data = crabs.boot, start = rep(1,4), 
  control = glm.control(trace = TRUE))
  
fit.addreg <- addreg(formula(fit.glm), family = poisson, data = crabs.boot,
  trace = 1)

# Speed up convergence by using single EM algorithm
fit.addreg.em <- update(fit.addreg, method = "em")

# Speed up convergence by using acceleration methods
fit.addreg.acc <- update(fit.addreg, accelerate = "squarem")
fit.addreg.em.acc <- update(fit.addreg.em, accelerate = "squarem")
  
# Usual S3 methods work on addreg objects
summary(fit.addreg)
vcov(fit.addreg)
confint(fit.addreg)
summary(predict(fit.addreg), type = "response")

fit.addreg2 <- addreg(update(formula(fit.glm), ~ . - factor(GoodSpine)),
  family = poisson, data = crabs.boot, trace = 1)
anova(fit.addreg2, fit.addreg, test = "LRT")

# Account for overdispersion (use start to speed it up a little)
fit.addreg.od <- addreg(Satellites ~ factor(Dark) + factor(GoodSpine),
  family = negbin1, data = crabs.boot, trace = 1,
  start = c(4.3423675,-2.4059273,-0.4531984,5.969648))
summary(fit.addreg.od)



