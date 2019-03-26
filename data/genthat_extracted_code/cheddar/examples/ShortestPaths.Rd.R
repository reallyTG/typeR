library(cheddar)


### Name: ShortestPaths
### Title: Path lengths
### Aliases: ShortestPaths CharacteristicPathLength
### Keywords: utilities

### ** Examples

data(Benguela)

# Compare weighted and unweighted
ShortestPaths(Benguela)
ShortestPaths(Benguela, weight.by='diet.fraction')

CharacteristicPathLength(Benguela)



