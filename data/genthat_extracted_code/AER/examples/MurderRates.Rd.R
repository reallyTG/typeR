library(AER)


### Name: MurderRates
### Title: Determinants of Murder Rates in the United States
### Aliases: MurderRates
### Keywords: datasets

### ** Examples

data("MurderRates")

## Maddala (2001, pp. 331)
fm_lm <- lm(rate ~ . + I(executions > 0), data = MurderRates)
summary(fm_lm)

model <- I(executions > 0) ~ time + income + noncauc + lfp + southern
fm_lpm <- lm(model, data = MurderRates)
summary(fm_lpm)

## Binomial models. Note: southern coefficient
fm_logit <- glm(model, data = MurderRates, family = binomial)
summary(fm_logit)

fm_logit2 <- glm(model, data = MurderRates, family = binomial,
  control = list(epsilon = 1e-15, maxit = 50, trace = FALSE))
summary(fm_logit2)

fm_probit <- glm(model, data = MurderRates, family = binomial(link = "probit"))
summary(fm_probit)

fm_probit2 <- glm(model, data = MurderRates , family = binomial(link = "probit"),
  control = list(epsilon = 1e-15, maxit = 50, trace = FALSE))
summary(fm_probit2)

## Explanation: quasi-complete separation
with(MurderRates, table(executions > 0, southern))



