library(eha)


### Name: swe07
### Title: Swedish population and deaths in ages 61-80, 2007.
### Aliases: swe07
### Keywords: datasets

### ** Examples

data(swe07)
fit <- glm(deaths ~ offset(log.pop) + sex * as.factor(age), family = poisson, data = swe07)
drop1(fit, test = "Chisq")  ## Proportional hazards?



