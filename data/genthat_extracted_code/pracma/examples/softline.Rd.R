library(pracma)


### Name: softline
### Title: Soft (Inexact) Line Search
### Aliases: softline
### Keywords: optimize

### ** Examples

##  Himmelblau function
  f_himm <- function(x) (x[1]^2 + x[2] - 11)^2 + (x[1] + x[2]^2 - 7)^2
  g_himm <- function(x) {
    w1 <- (x[1]^2 + x[2] - 11); w2 <- (x[1] + x[2]^2 - 7)
    g1 <- 4*w1*x[1] + 2*w2;     g2 <- 2*w1 + 4*w2*x[2]
    c(g1, g2)
  }
  # Find inexact minimum from [6, 6] in the direction [-1, -1] !
  softline(c(6, 6), c(-1, -1), f_himm, g_himm)
  # [1] 3.458463

  # Find the same minimum by using the numerical gradient
  softline(c(6, 6), c(-1, -1), f_himm)
  # [1] 3.458463



