library(elo)


### Name: elo.calc
### Title: Elo functions
### Aliases: elo.calc elo.calc elo.calc.default elo.calc.formula

### ** Examples

elo.calc(c(1, 0), c(1500, 1500), c(1500, 1600), k = 20)

dat <- data.frame(wins.A = c(1, 0), elo.A = c(1500, 1500),
                  elo.B = c(1500, 1600), k = c(20, 20))
elo.calc(wins.A ~ elo.A + elo.B + k(k), data = dat)



