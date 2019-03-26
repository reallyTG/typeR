library(elo)


### Name: elo.prob
### Title: Elo functions
### Aliases: elo.prob elo.prob elo.prob.default elo.prob.formula

### ** Examples

elo.prob(1500, 1500)
elo.prob(c(1500, 1500), c(1500, 1600))

dat <- data.frame(wins.A = c(1, 0), elo.A = c(1500, 1500),
                  elo.B = c(1500, 1600), k = c(20, 20))
elo.prob(~ elo.A + elo.B, data = dat)

## Also works to include the wins and k:
elo.prob(wins.A ~ elo.A + elo.B + k(k), data = dat)

## Also allows teams
elo.prob(c("A", "B"), c("C", "C"), elos = c(A = 1500, B = 1600, C = 1500))




