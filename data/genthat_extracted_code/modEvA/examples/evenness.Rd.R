library(modEvA)


### Name: evenness
### Title: Evenness in a binary vector.
### Aliases: evenness

### ** Examples

(x <- rep(c(0, 1), each = 5))
(y <- c(rep(0, 3), rep(1, 7)))
(z <- c(rep(0, 7), rep(1, 3)))

prevalence(x)
evenness(x)

prevalence(y)
evenness(y)

prevalence(z)
evenness(z)



