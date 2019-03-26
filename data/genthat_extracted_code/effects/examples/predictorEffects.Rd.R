library(effects)


### Name: predictorEffects
### Title: Functions For Computing Predictor Effects
### Aliases: predictorEffect predictorEffect.svyglm predictorEffect.default
###   predictorEffects predictorEffects.default
### Keywords: hplot models

### ** Examples

mod <- lm(prestige ~ type*(education + income) + women, Prestige)
plot(predictorEffect("income", mod))
plot(predictorEffects(mod, ~ education + income + women))

# svyglm() example (adapting an example from the survey package)
## No test: 
if (require(survey)){
  data(api)
  dstrat<-svydesign(id=~1, strata=~stype, weights=~pw,
    data=apistrat, fpc=~fpc)
  mod <- svyglm(sch.wide ~ ell + meals + mobility, design=dstrat,
    family=quasibinomial())
  plot(predictorEffects(mod),
    axes=list(y=list(lim=log(c(0.4, 0.99)/c(0.6, 0.01)),
      ticks=list(at=c(0.4, 0.75, 0.9, 0.95, 0.99)))))
}
## End(No test)



