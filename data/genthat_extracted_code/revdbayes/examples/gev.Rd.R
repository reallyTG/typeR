library(revdbayes)


### Name: gev
### Title: The Generalised Extreme Value Distribution
### Aliases: gev dgev pgev qgev rgev

### ** Examples

dgev(-1:4, 1, 0.5, 0.8)
dgev(1:6, 1, 0.5, -0.2, log = TRUE)
dgev(1, shape = c(-0.2, 0.4))

pgev(-1:4, 1, 0.5, 0.8)
pgev(1:6, 1, 0.5, -0.2)
pgev(1, c(1, 2), c(1, 2), c(-0.2, 0.4))
pgev(-3, c(1, 2), c(1, 2), c(-0.2, 0.4))
pgev(7, 1, 1, c(-0.2, 0.4))

qgev((1:9)/10, 2, 0.5, 0.8)
qgev(0.5, c(1,2), c(0.5, 1), c(-0.5, 0.5))

p <- (1:9)/10
pgev(qgev(p, 1, 2, 0.8), 1, 2, 0.8)

rgev(6, 1, 0.5, 0.8)



