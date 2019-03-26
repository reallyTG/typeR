library(AssocTests)


### Name: npt
### Title: Nonparametric trend test based on the nonparametric risk under a
###   given genetic model
### Aliases: npt

### ** Examples

g <- rbinom(1500, 2, 0.3)
y <- 0.5 + 0.25 * g + rgev(1500, 0, 0, 5)
npt(y, g, 0.5)



