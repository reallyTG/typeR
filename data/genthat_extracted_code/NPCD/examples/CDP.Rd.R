library(NPCD)


### Name: CDP
### Title: Probability of correct response for cognitive diagnostic models
### Aliases: CDP

### ** Examples

# Generate item and examinee profiles

Q <- c(1, 0, 0)
alpha <- c(1, 0, 0)
slip <- 0.2
guess <- 0.1
my.par <- list(slip=slip, guess=guess)
CDP(Q, my.par, alpha, model="DINA")



