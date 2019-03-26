library(quanteda)


### Name: affinity
### Title: Internal function to fit the likelihood scaling mixture model.
### Aliases: affinity
### Keywords: internal textmodel

### ** Examples

p <- matrix(c(c(5/6, 0, 1/6), c(0, 4/5, 1/5)), nrow = 3,
            dimnames = list(c("A", "B", "C"), NULL))
theta <- c(.2, .8)
q <- drop(p %*% theta)
x <- 2 * q
(fit <- affinity(p, x))



