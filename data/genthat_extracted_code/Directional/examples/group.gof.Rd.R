library(Directional)


### Name: Goodness of fit test for grouped data
### Title: Goodness of fit test for grouped data
### Aliases: group.gof
### Keywords: Grouped data von Mises-Fisher distribution

### ** Examples

x <- rvonmises(100, 2, 10)
g <- seq(min(x) - 0.1, max(x) + 0.1, length = 6)
ni <- as.vector( table( cut(x, g) ) )
group.gof(g, ni, 2, 10, dist = "vm", rads = TRUE, R = 299, ncores = 1)
group.gof(g, ni, 2, 5, dist = "vm", rads = TRUE, R = 299, ncores = 1)



