library(rockchalk)


### Name: centralValues
### Title: Central Tendency estimates for variables
### Aliases: centralValues

### ** Examples

myDat <- data.frame(x=rnorm(100), y=rpois(100,l=4), z = cut(rnorm(100), c(-10,-1,0,10)))
centralValues(myDat)



