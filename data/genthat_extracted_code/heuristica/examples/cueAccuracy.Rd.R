library(heuristica)


### Name: cueAccuracy
### Title: Calculate the accuracy of using a cue to predict a criterion.
### Aliases: cueAccuracy

### ** Examples

cueValidity(c(5,1), c(1,0))
cueAccuracy(c(5,1), c(1,0))
# Both return 1.
cueValidity(c(5,2,1), c(1,0,0))
cueAccuracy(c(5,2,1), c(1,0,0))
# Cue validity still returns 1 but cue accuracy returns (2+0.5)/3 = 0.833.



