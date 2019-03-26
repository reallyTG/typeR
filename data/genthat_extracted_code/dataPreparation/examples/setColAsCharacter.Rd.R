library(dataPreparation)


### Name: setColAsCharacter
### Title: Set columns as character
### Aliases: setColAsCharacter

### ** Examples

# Build a fake data.frame
dataSet <- data.frame(numCol = c(1, 2, 3), factorCol = as.factor(c("a", "b", "c")))

# Set numCol and factorCol as character
dataSet <- setColAsCharacter(dataSet, cols = c("numCol", "factorCol"))



