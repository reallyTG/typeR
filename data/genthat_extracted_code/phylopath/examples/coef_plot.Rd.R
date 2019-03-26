library(phylopath)


### Name: coef_plot
### Title: Plot path coefficients and their confidence intervals or
###   standard errors.
### Aliases: coef_plot

### ** Examples

  d <- DAG(LS ~ BM, NL ~ BM, DD ~ NL + LS)
  plot(d)
  d_fitted <- est_DAG(d, rhino, rhino_tree, 'lambda')
  plot(d_fitted)
  coef_plot(d_fitted)
  # to create a horizontal version, use this:
  coef_plot(d_fitted, reverse_order = TRUE) + ggplot2::coord_flip()



