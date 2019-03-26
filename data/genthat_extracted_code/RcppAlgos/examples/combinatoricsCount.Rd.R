library(RcppAlgos)


### Name: comboCount
### Title: Number of combinations/permutations
### Aliases: comboCount permuteCount

### ** Examples

## Same interface as the respective "general" functions:
## i.e. comboGeneral & permuteGeneral

comboCount(25, 12)

permuteCount(15, 7, TRUE)

comboCount(25, 12, freqs = rep(2, 25))

## Return object of class 'bigz'
comboCount(250, 15, freqs = rep(2, 250))



