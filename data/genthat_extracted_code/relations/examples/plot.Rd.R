library(relations)


### Name: plot
### Title: Visualize Relations
### Aliases: plot.relation plot.relation_ensemble
### Keywords: math

### ** Examples

require("sets")				# set() etc.
if(require("Rgraphviz")) {
  ## simple example
  plot(as.relation(1 : 5))

  ## inclusion on a power set:
  ps <- 2 ^ set("a", "b", "c")
  inc <- set_outer(ps, set_is_subset)
  R <- relation(incidence = inc)
  plot(relation_ensemble(R, R), type = c("simplified", "raw"))
}



