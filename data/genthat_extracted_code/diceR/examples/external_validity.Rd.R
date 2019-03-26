library(diceR)


### Name: external_validity
### Title: External validity indices
### Aliases: external_validity ev_nmi ev_confmat

### ** Examples

set.seed(1)
E <- matrix(rep(sample(1:4, 1000, replace = TRUE)), nrow = 100, byrow =
              FALSE)
x <- sample(1:4, 100, replace = TRUE)
y <- sample(1:4, 100, replace = TRUE)
ev_nmi(x, y)
ev_confmat(x, y)



