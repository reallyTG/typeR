library(drfit)


### Name: IM1xVibrio
### Title: Dose-Response data for 1-methyl-3-alkylimidazolium
###   tetrafluoroborates in V. fischeri
### Aliases: IM1xVibrio
### Keywords: datasets

### ** Examples

  rIM1xVibrio <- drfit(IM1xVibrio, logit = TRUE, chooseone = FALSE,
                       showED50 = TRUE, EDx = c(10, 20))
  print(rIM1xVibrio, digits = 4)

  rIM1xVibrio.drc <- drcfit(IM1xVibrio, logit = TRUE, chooseone = FALSE,
                            showED50 = TRUE, EDx = c(10, 20))
  print(rIM1xVibrio.drc, digits = 4)



