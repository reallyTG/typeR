library(heuristica)


### Name: cueValidity
### Title: Calculate the cue validity.
### Aliases: cueValidity

### ** Examples

cueValidity(c(5,1), c(1,0))
# Returns 1.
cueValidity(c(5,2,1), c(1,0,0))
# Also returns 1
cueValidity(c(5,2,1), c(0,0,1))
# Returns 0.
cueValidity(c(5,2,1), c(1,0,1))
# Returns 0.5.



