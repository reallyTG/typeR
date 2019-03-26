library(extraDistr)


### Name: Multinomial
### Title: Multinomial distribution
### Aliases: Multinomial dmnom rmnom
### Keywords: distribution

### ** Examples


# Generating 10 random draws from multinomial distribution
# parametrized using a vector

(x <- rmnom(10, 3, c(1/3, 1/3, 1/3)))

# Results are consistent with dmultinom() from stats:

all.equal(dmultinom(x[1,], 3, c(1/3, 1/3, 1/3)),
          dmnom(x[1, , drop = FALSE], 3, c(1/3, 1/3, 1/3)))




