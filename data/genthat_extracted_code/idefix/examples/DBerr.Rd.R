library(idefix)


### Name: DBerr
### Title: DB error
### Aliases: DBerr

### ** Examples

des <- example_design
mu = c(-1, -1.5, -1, -1.5, 0.5, 1)
Sigma = diag(length(mu))
par.draws <- MASS::mvrnorm(100, mu = mu, Sigma = Sigma)
n.alts = 2
DBerr(par.draws = par.draws, des = des, n.alts = n.alts)

mu = c(-0.5, -1, -0.5, -1, 0.5, 1)
Sigma = diag(length(mu))
par.draws <- MASS::mvrnorm(100, mu = mu, Sigma = Sigma)
DBerr(par.draws = par.draws, des = des, n.alts = n.alts)



