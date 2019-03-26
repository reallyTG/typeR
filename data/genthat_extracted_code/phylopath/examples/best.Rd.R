library(phylopath)


### Name: best
### Title: Extract and estimate the best supported model from a
###   phylogenetic path analysis.
### Aliases: best

### ** Examples

  candidates <- list(A = DAG(LS ~ BM, NL ~ BM, DD ~ NL),
                     B = DAG(LS ~ BM, NL ~ LS, DD ~ NL))
  p <- phylo_path(candidates, rhino, rhino_tree)
  best_model <- best(p)
  # Print the best model to see coefficients, se and ci:
  best_model
  # Plot to show the weighted graph:
  plot(best_model)




