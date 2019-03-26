library(lg)


### Name: dlg_bivariate
### Title: Bivariate density estimation
### Aliases: dlg_bivariate

### ** Examples

  x <- cbind(rnorm(100), rnorm(100))
  bw <- c(1, 1)
  eval_points <- cbind(seq(-4, 4, 1), seq(-4, 4, 1))

  estimate <- dlg_bivariate(x, eval_points = eval_points, bw = bw)




