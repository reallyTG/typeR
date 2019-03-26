library(sjstats)


### Name: p_value
### Title: Get p-values from regression model objects
### Aliases: p_value p_value.lmerMod

### ** Examples

data(efc)
# linear model fit
fit <- lm(neg_c_7 ~ e42dep + c172code, data = efc)
p_value(fit)

# Generalized Least Squares fit
library(nlme)
fit <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
p_value(fit)

# lme4-fit
library(lme4)
sleepstudy$mygrp <- sample(1:45, size = 180, replace = TRUE)
fit <- lmer(Reaction ~ Days + (1 | mygrp) + (1 | Subject), sleepstudy)
pv <- p_value(fit, p.kr = TRUE)

# normal output
pv

# add information on df and t-statistic
print(pv, summary = TRUE)
# or
summary(pv)




