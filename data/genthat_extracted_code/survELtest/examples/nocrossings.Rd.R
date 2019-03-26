library(survELtest)


### Name: nocrossings
### Title: The test that excludes the possibility of crossings or
###   alternative orderings
### Aliases: nocrossings

### ** Examples

library(survELtest)
nocrossings(threearm[1:30,],group_order=c(3,2,1),sided=1)
## OUTPUT:
## $decision
## [1] 1



