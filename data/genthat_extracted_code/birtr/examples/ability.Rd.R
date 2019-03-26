library(birtr)


### Name: ability
### Title: Ability Estimation
### Aliases: ability
### Keywords: groupinv

### ** Examples

u <- c(1, 0, 1)
b <- c(-1.0, 0.0, 1.0)
a <- c(1.0, 1.2, 0.8)
ability(2, u, b, a) # ability(2, u, b, a, c = rep(0, length(b)))
theta.se <- ability(2, u, b, a)
theta.se



