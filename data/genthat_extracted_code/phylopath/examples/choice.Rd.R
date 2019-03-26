library(phylopath)


### Name: choice
### Title: Extract and estimate an arbitrary model from a phylogenetic path
###   analysis.
### Aliases: choice

### ** Examples

  candidates <- list(A = DAG(LS ~ BM, NL ~ BM, DD ~ NL),
                     B = DAG(LS ~ BM, NL ~ LS, DD ~ NL))
  p <- phylo_path(candidates, rhino, rhino_tree)
  my_model <- choice(p, "B")
  # Print the best model to see coefficients, se and ci:
  my_model
  # Plot to show the weighted graph:
  plot(my_model)




