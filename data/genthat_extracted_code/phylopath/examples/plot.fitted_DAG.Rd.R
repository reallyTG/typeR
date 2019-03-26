library(phylopath)


### Name: plot.fitted_DAG
### Title: Plot a directed acyclic graph with path coefficients.
### Aliases: plot.fitted_DAG

### ** Examples

  d <- DAG(LS ~ BM, NL ~ BM, DD ~ NL + LS)
  d_fitted <- est_DAG(d, rhino, rhino_tree, 'lambda')
  plot(d_fitted)



