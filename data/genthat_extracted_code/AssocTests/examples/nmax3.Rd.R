library(AssocTests)


### Name: nmax3
### Title: NMAX3 based on the maximum value of the three nonparametric
###   trend tests under the recessive, additive, and dominant models
### Aliases: nmax3

### ** Examples

g <- rbinom(1500, 2, 0.3)
y <- 0.5 + 0.25 * g + rgev(1500, 0, 0, 5)
nmax3(y, g)



