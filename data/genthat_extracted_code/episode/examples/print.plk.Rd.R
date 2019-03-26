library(episode)


### Name: print.plk
### Title: Print 'plk' object
### Aliases: print.plk

### ** Examples

# Power law system
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  0, 0, 0, 0), ncol = 4, byrow = TRUE)
p <- plk(A)
p



