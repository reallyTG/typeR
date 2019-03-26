library(interactions)


### Name: sim_slopes
### Title: Perform a simple slopes analysis.
### Aliases: sim_slopes

### ** Examples


# Using a fitted model as formula input
fiti <- lm(Income ~ Frost + Murder * Illiteracy,
  data = as.data.frame(state.x77))
sim_slopes(model = fiti, pred = Murder, modx = Illiteracy)

# With svyglm
if (requireNamespace("survey")) {
library(survey)
data(api)
dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw,
                    data = apistrat, fpc = ~fpc)
regmodel <- svyglm(api00 ~ ell * meals, design = dstrat)
sim_slopes(regmodel, pred = ell, modx = meals)

# 3-way with survey and factor input
regmodel <- svyglm(api00 ~ ell * meals * sch.wide, design = dstrat)
sim_slopes(regmodel, pred = ell, modx = meals, mod2 = sch.wide)
}




