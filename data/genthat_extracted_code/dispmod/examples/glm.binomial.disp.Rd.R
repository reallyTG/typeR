library(dispmod)


### Name: glm.binomial.disp
### Title: Overdispersed binomial logit models
### Aliases: glm.binomial.disp
### Keywords: models regression

### ** Examples

data(orobanche)

mod <- glm(cbind(germinated, seeds-germinated) ~ host*variety, data = orobanche,
           family = binomial(logit))
summary(mod)

mod.disp <- glm.binomial.disp(mod)
summary(mod.disp)
mod.disp$dispersion



