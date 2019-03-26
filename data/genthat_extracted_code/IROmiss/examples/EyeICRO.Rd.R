library(IROmiss)


### Name: EyeICRO
### Title: Variable selection for Bardet-Biedl syndrome data with missing
###   observations.
### Aliases: EyeICRO
### Keywords: EyeICRO

### ** Examples

    ## No test: 
library(IROmiss)
data(eye_norm)
EyeICRO(eye_norm$x, eye_norm$y, rate = 0.05, alpha1 = 0.1, alpha2 = 0.1)
      
## End(No test)



