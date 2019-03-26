library(MortalityTables)


### Name: periodTransitionProbabilities
### Title: Return all period transition probabilities of the pension table
### Aliases: periodTransitionProbabilities
###   periodTransitionProbabilities,pensionTable-method

### ** Examples

pensionTables.load("USA_PensionPlans")
# transitionProbabilities internally calls periodTransitionProbabilities
# if a Period is given:
transitionProbabilities(RP2014.male, Period = 1955)
periodTransitionProbabilities(RP2014.male, Period = 1955)
periodTransitionProbabilities(RP2014.male, Period = 2025)




