library(phylopath)


### Name: phylo_path
### Title: Compare causal models in a phylogenetic context.
### Aliases: phylo_path

### ** Examples

  #see vignette('intro_to_phylopath') for more details
  candidates <- list(A = DAG(LS ~ BM, NL ~ BM, DD ~ NL),
                     B = DAG(LS ~ BM, NL ~ LS, DD ~ NL))
  p <- phylo_path(candidates, rhino, rhino_tree)

  # Printing p gives some general information:
  p
  # And the summary gives statistics to compare the models:
  summary(p)




