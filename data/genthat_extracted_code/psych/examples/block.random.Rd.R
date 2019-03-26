library(psych)


### Name: block.random
### Title: Create a block randomized structure for n independent variables
### Aliases: block.random
### Keywords: multivariate

### ** Examples

br <- block.random(n=24,c(2,3))
pairs.panels(br)
br <- block.random(96,c(time=4,drug=3,sex=2))
pairs.panels(br)



