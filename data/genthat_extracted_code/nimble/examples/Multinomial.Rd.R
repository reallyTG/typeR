library(nimble)


### Name: Multinomial
### Title: The Multinomial Distribution
### Aliases: Multinomial dmulti multinomial rmulti

### ** Examples

size <- 30
probs <- c(1/4, 1/10, 1 - 1/4 - 1/10)
x <- rmulti(1, size, probs)
dmulti(x, size, probs)



