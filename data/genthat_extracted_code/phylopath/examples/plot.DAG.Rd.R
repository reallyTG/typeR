library(phylopath)


### Name: plot.DAG
### Title: Plot a directed acyclic graph.
### Aliases: plot.DAG

### ** Examples

  d <- DAG(a ~ b + c + d)
  plot(d)

  # Plot with manually defined positions:
  ml <- data.frame(
    name = c('a', 'b', 'c', 'd'),
    x = c(1, 1, 2, 2),
    y = c(1, 2, 1, 2)
  )
  plot(d, manual_layout = ml)




