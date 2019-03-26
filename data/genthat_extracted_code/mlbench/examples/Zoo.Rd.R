library(mlbench)


### Name: Zoo
### Title: Zoo Data
### Aliases: Zoo
### Keywords: datasets

### ** Examples

data(Zoo)
summary(Zoo)

## see the annimals grouped by type
tapply(rownames(Zoo), Zoo$type, function(x) x)

## which animals have fins?
rownames(Zoo)[Zoo$fins]



