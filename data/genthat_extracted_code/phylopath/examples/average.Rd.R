library(phylopath)


### Name: average
### Title: Extract and average the best supported models from a
###   phylogenetic path analysis.
### Aliases: average

### ** Examples

  candidates <- list(
    A = DAG(LS ~ BM, NL ~ BM, DD ~ NL, RS ~ BM + NL),
    B = DAG(LS ~ BM, NL ~ BM + RS, DD ~ NL)
  )
  p <- phylo_path(candidates, rhino, rhino_tree)
  summary(p)

  # Models A and B have similar support, so we may decide to take
  # their average.

  avg_model <- average(p)
  # Print the average model to see coefficients, se and ci:
  avg_model

  ## Not run: 
##D   # Plot to show the weighted graph:
##D   plot(avg_model)
##D 
##D   # One can see that an averaged model is not necessarily a DAG itself.
##D   # This model actually has a path in two directions.
##D 
##D   # Note that coefficients that only occur in one of the models become much
##D   # smaller when we use full averaging:
##D 
##D   coef_plot(avg_model)
##D   coef_plot(average(p, method = 'full'))
##D   
## End(Not run)




