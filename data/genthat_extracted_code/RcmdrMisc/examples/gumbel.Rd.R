library(RcmdrMisc)


### Name: Gumbel
### Title: The Gumbel Distribution
### Aliases: Gumbel dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples

x <- 100 + 5*c(-Inf, -1, 0, 1, 2, 3, Inf, NA)
dgumbel(x, 100, 5)
pgumbel(x, 100, 5)

p <- c(0, .25, .5, .75, 1, NA)
qgumbel(p, 100, 5)

summary(rgumbel(1e5, 100, 5))



