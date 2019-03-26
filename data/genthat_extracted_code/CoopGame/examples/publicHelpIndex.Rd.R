library(CoopGame)


### Name: publicHelpIndex
### Title: Compute Public Help index Theta
### Aliases: publicHelpIndex publicHelpThetaIndex publicHelpIndexTheta

### ** Examples

library(CoopGame)
publicHelpIndex(v=c(0,0,0,0,1,0,1))

## No test: 
#Example from paper by Stach (2016), p. 105:
library(CoopGame)
v=c(0,0,0,1,1,0,1)
publicHelpIndex(v) 
#result: 0.4285714 0.2857143 0.2857143

#Second example from paper by Stach (2016), p. 105:
library(CoopGame)
v=c(0,0,0,0,1,1,0,0,0,0,1,1,1,0,1)
publicHelpIndex(v)
#result: 0.3529412 0.2352941 0.2352941 0.1764706
## End(No test)




