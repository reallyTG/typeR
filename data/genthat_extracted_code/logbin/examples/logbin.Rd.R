library(logbin)


### Name: logbin
### Title: Log-Binomial Regression
### Aliases: logbin
### Keywords: models regression

### ** Examples

require(glm2)
data(heart)
## No test: 
#======================================================
#  Model with periodic non-convergence when glm is used
#======================================================

start.p <- sum(heart$Deaths) / sum(heart$Patients)

fit.glm <- glm(cbind(Deaths, Patients-Deaths) ~ factor(AgeGroup) + factor(Severity) +
  factor(Delay) + factor(Region), family = binomial(log), 
  start = c(log(start.p), -rep(1e-4, 8)), data = heart,
  trace = TRUE, maxit = 100)

fit.logbin <- logbin(formula(fit.glm), data = heart, trace = 1)
summary(fit.logbin)

# Speed up convergence by using single EM algorithm
fit.logbin.em <- update(fit.logbin, method = "em")

# Speed up convergence by using acceleration methods
fit.logbin.acc <- update(fit.logbin, accelerate = "squarem")
fit.logbin.em.acc <- update(fit.logbin.em, accelerate = "squarem")
## End(No test)

#=============================
#  Model with interaction term
#=============================

heart$AgeSev <- 10 * heart$AgeGroup + heart$Severity

fit.logbin.int <- logbin(cbind(Deaths, Patients-Deaths) ~ factor(AgeSev) +
  factor(Delay) + factor(Region), data = heart, trace = 1, maxit = 100000)
  
summary(fit.logbin.int)
vcov(fit.logbin.int)
confint(fit.logbin.int)
summary(predict(fit.logbin.int, type = "response"))
## No test: 
anova(fit.logbin, fit.logbin.int, test = "Chisq")
## End(No test)



