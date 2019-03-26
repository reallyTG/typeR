library(parsec)


### Name: plot.cover
### Title: Hasse diagram
### Aliases: plot.cover plot.incidence plot.wprof

### ** Examples

prf <- var2prof(varlen = c(5, 5, 5))
prf$freq <- sample(c(rep(0, 20), 1, 2, 3), 5*5*5, replace = TRUE)
prf <- obsprof(prf)

z <- getzeta(prf)

plot(z, shape = "equispaced", col = prf$freq, lwd = 2)



