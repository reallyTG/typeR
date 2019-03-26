library(phylopath)


### Name: average_DAGs
### Title: Perform model averaging on a list of DAGs.
### Aliases: average_DAGs

### ** Examples

  # Normally, I would advocate the use of the phylo_path and average
  # functions, but this code shows how to average any set of models. Note
  # that not many checks are implemented, so you may want to be careful and
  # make sure the DAGs make sense and contain the same variables!
  candidates <- list(A = DAG(LS ~ BM, NL ~ BM, DD ~ NL),
                     B = DAG(LS ~ BM, NL ~ LS, DD ~ NL))
  fit_cand <- lapply(candidates, est_DAG, rhino, rhino_tree,
                     model = 'lambda', method = 'logistic_MPLE')
  ave_cand <- average_DAGs(fit_cand)
  coef_plot(ave_cand)



