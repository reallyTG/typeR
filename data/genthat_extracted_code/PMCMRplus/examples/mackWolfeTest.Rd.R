library(PMCMRplus)


### Name: mackWolfeTest
### Title: Mack-Wolfe Test for Umbrella Alternatives
### Aliases: mackWolfeTest mackWolfeTest.default mackWolfeTest.formula
### Keywords: htest nonparametric

### ** Examples

## Example from Table 6.10 of Hollander and Wolfe (1999).
## Plates with Salmonella bacteria of strain TA98 were exposed to
## various doses of Acid Red 114 (in mu g / ml).
## The data are the numbers of visible revertant colonies on 12 plates.
## Assume a peak at D333 (i.e. p = 3).
x <- c(22, 23, 35, 60, 59, 54, 98, 78, 50, 60, 82, 59, 22, 44,
  33, 23, 21, 25)
g <- as.ordered(rep(c(0, 100, 333, 1000, 3333, 10000), each=3))
plot(x ~ g)
mackWolfeTest(x=x, g=g, p=3)




