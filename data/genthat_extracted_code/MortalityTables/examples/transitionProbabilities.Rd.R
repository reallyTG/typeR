library(MortalityTables)


### Name: transitionProbabilities
### Title: Return all transition probabilities of the pension table
###   (generational probabilities)
### Aliases: transitionProbabilities
###   transitionProbabilities,pensionTable-method

### ** Examples

pensionTables.load("USA_PensionPlans")
transitionProbabilities(RP2014.male, YOB = 1962)
transitionProbabilities(RP2014.male, Period = 1955)
transitionProbabilities(RP2014.male, Period = 2025)




