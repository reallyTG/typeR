library(lavaan.survey)


### Name: cardinale
### Title: Nutrient experiment on patches of algae in Californian streams.
### Aliases: cardinale

### ** Examples

  data(cardinale)
  summary(cardinale)
  
  model.card <- '
     PatchDiversity ~ logNutrient + logNutrient2 + StreamDiversity
     Biomass ~ PatchDiversity + logNutrient
     O2Production ~ logNutrient + Biomass
     logNutrient ~~ logNutrient2'
  
  fit.card <- sem(model.card, data = cardinale, fixed.x = FALSE, estimator = "MLM")
  
  des.card <- svydesign(ids = ~Stream, probs = ~1, data = cardinale)
  fit.card.survey <- lavaan.survey(fit.card, des.card, estimator = "MLM")
  
  pval.pFsum(fit.card.survey, survey.design = des.card)




