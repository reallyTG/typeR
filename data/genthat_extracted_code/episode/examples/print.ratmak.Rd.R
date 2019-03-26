library(episode)


### Name: print.ratmak
### Title: Print 'ratmak' object
### Aliases: print.ratmak

### ** Examples

# Rational mass action kinetics
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
x0 <- c(X = 1, Y = 4, Z = 0.1, W = 0.1)
time <- seq(0, 1, by = .1)

rmak <- ratmak(A, diag(4))
rmak



