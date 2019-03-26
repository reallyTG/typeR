library(interactions)


### Name: interact_plot
### Title: Plot interaction effects in regression models
### Aliases: interact_plot

### ** Examples

# Using a fitted lm model
states <- as.data.frame(state.x77)
states$HSGrad <- states$`HS Grad`
fit <- lm(Income ~ HSGrad + Murder * Illiteracy, data = states)
interact_plot(model = fit, pred = Murder, modx = Illiteracy)

# Using interval feature
fit <- lm(accel ~ mag * dist, data = attenu)
interact_plot(fit, pred = mag, modx = dist, interval = TRUE,
  int.type = "confidence", int.width = .8)

# Using second moderator
fit <- lm(Income ~ HSGrad * Murder * Illiteracy, data = states)
interact_plot(model = fit, pred = Murder, modx = Illiteracy, mod2 = HSGrad)

# With svyglm
if (requireNamespace("survey")) {
library(survey)
data(api)
dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw,
                    data = apistrat, fpc = ~fpc)
regmodel <- svyglm(api00 ~ ell * meals, design = dstrat)
interact_plot(regmodel, pred = ell, modx = meals)
}

# With lme4
## Not run: 
##D library(lme4)
##D data(VerbAgg)
##D mv <- glmer(r2 ~ Anger * mode + (1 | item), data = VerbAgg,
##D             family = binomial,
##D             control = glmerControl("bobyqa"))
##D interact_plot(mv, pred = Anger, modx = mode)
## End(Not run)




