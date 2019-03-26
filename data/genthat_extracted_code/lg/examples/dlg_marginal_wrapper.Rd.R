library(lg)


### Name: dlg_marginal_wrapper
### Title: Marginal estimates for multivariate data
### Aliases: dlg_marginal_wrapper

### ** Examples

  data_matrix <- cbind(rnorm(100), rnorm(100))
  eval_matrix <- cbind(seq(-4, 4, 1), seq(-4, 4, 1))
  bw <- c(1, 1)

  estimate <- dlg_marginal_wrapper(data_matrix, eval_matrix = eval_matrix, bw = bw)




