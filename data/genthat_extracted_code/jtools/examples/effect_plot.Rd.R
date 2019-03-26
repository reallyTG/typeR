library(jtools)


### Name: effect_plot
### Title: Plot simple effects in regression models
### Aliases: effect_plot

### ** Examples

# Using a fitted lm model
states <- as.data.frame(state.x77)
states$HSGrad <- states$`HS Grad`
fit <- lm(Income ~ HSGrad + Murder,
  data = states)
effect_plot(model = fit, pred = Murder)

# Using polynomial predictor, plus intervals
fit <- lm(accel ~ poly(mag,3) + dist, data = attenu)
effect_plot(fit, pred = mag, interval = TRUE,
  int.type = "confidence", int.width = .8, data = attenu) # note data arg.

# With svyglm
if (requireNamespace("survey")) {
library(survey)
data(api)
dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw,
                    data = apistrat, fpc = ~fpc)
regmodel <- svyglm(api00 ~ ell + meals, design = dstrat)
effect_plot(regmodel, pred = ell, interval = TRUE)
}

# With lme4
## Not run: 
##D library(lme4)
##D data(VerbAgg)
##D mv <- glmer(r2 ~ Anger + mode + (1 | item), data = VerbAgg,
##D             family = binomial,
##D             control = glmerControl("bobyqa"))
##D effect_plot(mv, pred = Anger)
## End(Not run)




