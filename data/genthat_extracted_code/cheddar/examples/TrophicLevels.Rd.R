library(cheddar)


### Name: TrophicLevels
### Title: Trophic levels
### Aliases: PreyAveragedTrophicLevel FlowBasedTrophicLevel TrophicLevels
###   ShortestTrophicLevel ShortWeightedTrophicLevel LongestTrophicLevel
###   LongWeightedTrophicLevel ChainAveragedTrophicLevel TrophicHeight
### Keywords: utilities

### ** Examples

data(TL84)

# Six different measures of trophic level
TrophicLevels(TL84)

# The Benguela data contains diet.fraction
data(Benguela)

# Compare prey-averaged and flow-based
cbind(pa=PreyAveragedTrophicLevel(Benguela), 
      fb=FlowBasedTrophicLevel(Benguela, weight.by='diet.fraction'))



