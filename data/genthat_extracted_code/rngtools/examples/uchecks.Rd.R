library(rngtools)


### Name: checkRNG
### Title: Checking RNG Differences in Unit Tests
### Aliases: checkRNG

### ** Examples

#--- checkRNG ---

# check for differences in RNG
set.seed(123)
checkRNG(123)
try( checkRNG(123, 123) )
try( checkRNG(123, 1:3) )





