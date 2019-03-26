library(survival)


### Name: concordance
### Title: Compute the concordance statistic for data or a model
### Aliases: concordance concordance.coxph concordance.formula
###   concordance.lm concordance.survreg
### Keywords: survival

### ** Examples

fit1 <- coxph(Surv(ptime, pstat) ~ age + sex + mspike, mgus2)
concordance(fit1, timewt="n")  # 

# logistic regression
fit2 <- glm(pstat ~ age + sex + mspike, binomial, data= mgus2)
concordance(fit2)  # equal to the AUC



