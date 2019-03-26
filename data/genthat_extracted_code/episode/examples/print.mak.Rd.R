library(episode)


### Name: print.mak
### Title: Print 'mak' object
### Aliases: print.mak

### ** Examples

# Michaelis-Menten system
A <- matrix(
c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0), ncol = 4, byrow = TRUE)
B <- matrix(
c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
m <- mak(A, B)
m



