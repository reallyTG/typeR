library(AER)


### Name: SwissLabor
### Title: Swiss Labor Market Participation Data
### Aliases: SwissLabor
### Keywords: datasets

### ** Examples

data("SwissLabor")

### Gerfin (1996), Table I.
fm_probit <- glm(participation ~ . + I(age^2), data = SwissLabor,
  family = binomial(link = "probit"))
summary(fm_probit)

### alternatively
fm_logit <- glm(participation ~ . + I(age^2), data = SwissLabor,
  family = binomial)
summary(fm_logit)



