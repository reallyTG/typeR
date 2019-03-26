library(ndl)


### Name: estimateWeights
### Title: Estimation of the association weights using the equilibrium
###   equations of Danks (2003) for the Rescorla-Wagner equations.
### Aliases: estimateWeights
### Keywords: classif

### ** Examples

  data(danks)
  estimateWeights(cuesOutcomes=danks)

  data(plurals)
  plurals$Cues <- orthoCoding(plurals$WordForm, grams=1)
  round(estimateWeights(cuesOutcomes=plurals),2)
  
  data(serbian)
  serbian$Cues <- orthoCoding(serbian$WordForm, grams=2)
  serbian$Outcomes <- serbian$LemmaCase
  sw <- estimateWeights(cuesOutcomes=serbian)
  round(sw[1:5,1:6],2)



