library(sjstats)


### Name: robust
### Title: Robust standard errors for regression models
### Aliases: robust svy

### ** Examples

data(efc)
fit <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
summary(fit)
robust(fit)

confint(fit)
robust(fit, conf.int = TRUE)
robust(fit, vcov.type = "HC1", conf.int = TRUE) # "HC1" should be Stata default

library(sjmisc)
# dichtomozize service usage by "service usage yes/no"
efc$services <- sjmisc::dicho(efc$tot_sc_e, dich.by = 0)
fit <- glm(services ~ neg_c_7 + c161sex + e42dep,
           data = efc, family = binomial(link = "logit"))

robust(fit)
robust(fit, conf.int = TRUE, exponentiate = TRUE)




