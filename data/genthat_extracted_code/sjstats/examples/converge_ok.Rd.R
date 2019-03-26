library(sjstats)


### Name: converge_ok
### Title: Convergence test for mixed effects models
### Aliases: converge_ok is_singular

### ** Examples

library(sjmisc)
library(lme4)
data(efc)
# create binary response
efc$hi_qol <- dicho(efc$quol_5)
# prepare group variable
efc$grp = as.factor(efc$e15relat)
# data frame for fitted model
mydf <- data.frame(hi_qol = as.factor(efc$hi_qol),
                   sex = as.factor(efc$c161sex),
                   c12hour = as.numeric(efc$c12hour),
                   neg_c_7 = as.numeric(efc$neg_c_7),
                   grp = efc$grp)
# fit glmer
fit <- glmer(hi_qol ~ sex + c12hour + neg_c_7 + (1|grp),
             data = mydf, family = binomial("logit"))

converge_ok(fit)




