library(recurse)


### Name: getRecursions
### Title: Calculates recursion information from the trajectory
### Aliases: getRecursions getRecursions.data.frame getRecursions.Move
###   getRecursions.MoveStack

### ** Examples

data(martin)
revisits = getRecursions(martin, radius = 1)
plot(revisits, martin, legendPos = c(10, -15))
drawCircle(10, -10, 1)




