library(MortalityTables)


### Name: fillAges
### Title: Fill the given probabilities with NA to match the desired age
###   range.
### Aliases: fillAges

### ** Examples

# Ages 20-70 have linearly increasing death probabilities. Fill with 0 for the whole age range 0-120
fillAges(probs = c(0:50/50), givenAges = 20:70, neededAges = 0:120, fill = 0)




