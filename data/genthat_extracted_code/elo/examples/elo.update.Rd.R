library(elo)


### Name: elo.update
### Title: Elo functions
### Aliases: elo.update elo.update elo.update.default elo.update.formula

### ** Examples

elo.update(c(1, 0), c(1500, 1500), c(1500, 1600), k = 20)

dat <- data.frame(wins.A = c(1, 0), elo.A = c(1500, 1500),
                  elo.B = c(1500, 1600), k = c(20, 20))
elo.update(wins.A ~ elo.A + elo.B + k(k), data = dat)



