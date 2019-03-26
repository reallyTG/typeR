library(actuar)


### Name: Gumbel
### Title: The Gumbel Distribution
### Aliases: Gumbel dgumbel pgumbel qgumbel rgumbel mgumbel mgfgumbel
### Keywords: distribution

### ** Examples

dgumbel(c(-5, 0, 10, 20), 0.5, 2)

p <- (1:10)/10
pgumbel(qgumbel(p, 2, 3), 2, 3)

curve(pgumbel(x, 0.5, 2), from = -5, to = 20, col = "red")
curve(pgumbel(x, 1.0, 2), add = TRUE, col = "green")
curve(pgumbel(x, 1.5, 3), add = TRUE, col = "blue")
curve(pgumbel(x, 3.0, 4), add = TRUE, col = "cyan")

a <- 3; s <- 4
mgumbel(1, a, s)                        # mean
a - s * digamma(1)                      # same

mgumbel(2, a, s) - mgumbel(1, a, s)^2   # variance
(pi * s)^2/6                            # same



