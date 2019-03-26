library(DiceDesign)


### Name: factDesign
### Title: Full Factorial Designs
### Aliases: factDesign
### Keywords: design

### ** Examples

## First example
g <- factDesign(2,7)
plot(g$design,xlim=c(0,1),ylim=c(0,1))
## Second example
g <- factDesign(2,c(2,7))
plot(g$design,xlim=c(0,1),ylim=c(0,1))



