library(phylopath)


### Name: est_DAG
### Title: Add standardized path coefficients to a DAG.
### Aliases: est_DAG

### ** Examples

  d <- DAG(LS ~ BM, NL ~ BM, DD ~ NL + LS)
  plot(d)
  d_fitted <- est_DAG(d, rhino, rhino_tree, 'lambda')
  plot(d_fitted)



