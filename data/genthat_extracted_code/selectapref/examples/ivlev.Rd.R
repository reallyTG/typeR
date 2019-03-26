library(selectapref)


### Name: ivlev
### Title: Ivlev's electivity (Ivlev 1961). Returns Ivlev's electivity
###   index from vectors of consumed and available food items.
### Aliases: ivlev
### Keywords: ivlev selectivity

### ** Examples

availableprey <- c(10,10,10,10,10)
consumedprey <- c(9,0,0,1,5)
ivlev(available = availableprey, consumed = consumedprey, jacob = FALSE)
ivlev(available = availableprey, consumed = consumedprey, jacob = TRUE)




