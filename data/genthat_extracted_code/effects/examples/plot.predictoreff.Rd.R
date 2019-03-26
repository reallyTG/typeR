library(effects)


### Name: plot.predictoreff
### Title: Draw Predictor Effect Plots
### Aliases: plot.predictoreff plot.predictorefflist
### Keywords: hplot models

### ** Examples

mod <- lm(prestige ~ type*(education + income + women), Prestige)
plot(predictorEffects(mod, ~ income))



