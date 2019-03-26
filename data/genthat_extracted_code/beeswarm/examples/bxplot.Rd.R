library(beeswarm)


### Name: bxplot
### Title: Plot quantile lines
### Aliases: bxplot bxplot.default bxplot.formula
### Keywords: hplot

### ** Examples

  ## bxplot on bottom
  beeswarm(len ~ dose, data = ToothGrowth)
  bxplot(len ~ dose, data = ToothGrowth, add = TRUE)
  
  ## bxplot on top
  bxplot(decrease ~ treatment, data = OrchardSprays, probs = 0.5, col = 2)
  beeswarm(decrease ~ treatment, data = OrchardSprays, add = TRUE)

  ## Show deciles 
  data(breast)
  bxplot(time_survival ~ event_survival, data = breast, 
    probs = seq(0, 1, by = 0.1), col = rainbow(10))
  beeswarm(time_survival ~ event_survival, data = breast, 
    pch = 21, bg = "gray75", add = TRUE)



