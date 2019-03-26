library(revdbayes)


### Name: gp
### Title: The Generalised Pareto Distribution
### Aliases: gp dgp pgp qgp rgp

### ** Examples

dgp(0:4, scale = 0.5, shape = 0.8)
dgp(1:6, scale = 0.5, shape = -0.2, log = TRUE)
dgp(1, scale = 1, shape = c(-0.2, 0.4))

pgp(0:4, scale = 0.5, shape = 0.8)
pgp(1:6, scale = 0.5, shape = -0.2)
pgp(1, scale = c(1, 2), shape = c(-0.2, 0.4))
pgp(7, scale = 1, shape = c(-0.2, 0.4))

qgp((0:9)/10, scale = 0.5, shape = 0.8)
qgp(0.5, scale = c(0.5, 1), shape = c(-0.5, 0.5))

p <- (1:9)/10
pgp(qgp(p, scale = 2, shape = 0.8), scale = 2, shape = 0.8)

rgp(6, scale = 0.5, shape = 0.8)



