library(rucm)


### Name: ucm
### Title: Unobserved components methods for a time series
### Aliases: ucm

### ** Examples

modelNile <- ucm(Nile~0, data = Nile, slope = TRUE)
modelNile
modelNile$s.level



