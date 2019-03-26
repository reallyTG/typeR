library(synthpop)


### Name: SD2011
### Title: Social Diagnosis 2011 - Objective and Subjective Quality of Life
###   in Poland
### Aliases: SD2011
### Keywords: datasets

### ** Examples

  spineplot(englang ~ agegr, data = SD2011, xlab = "Age group", ylab = "Knowledge of English")
  boxplot(income ~ sex, data = SD2011[SD2011$income != -8,])



