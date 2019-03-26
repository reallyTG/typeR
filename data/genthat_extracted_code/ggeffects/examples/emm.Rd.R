library(ggeffects)


### Name: emm
### Title: Get marginal effects for model response
### Aliases: emm

### ** Examples

data(efc)
fit <- lm(barthtot ~ c12hour + neg_c_7 + c161sex + c172code, data = efc)
emm(fit)

# Example from ?MASS::polr
library(MASS)
options(contrasts = c("contr.treatment", "contr.poly"))
house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
emm(house.plr)




