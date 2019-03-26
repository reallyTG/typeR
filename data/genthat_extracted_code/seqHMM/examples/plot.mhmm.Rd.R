library(seqHMM)


### Name: plot.mhmm
### Title: Interactive Plotting for Mixed Hidden Markov Model (mhmm)
### Aliases: plot.mhmm

### ** Examples

# Loading mixture hidden Markov model (mhmm object)
# of the biofam data
data("mhmm_biofam")

# Plotting only the first cluster
plot(mhmm_biofam, which.plots = 1)

if (interactive()) {
  # Plotting each cluster (change with Enter)
  plot(mhmm_biofam)

  # Choosing the cluster (one at a time)
  plot(mhmm_biofam, ask = TRUE)

  # Loading MHMM of the mvad data
  data("mhmm_mvad")

  # Plotting models in the same graph (in a grid)
  # Note: the plotting window must be high enough!
  set.seed(123)
  plot(mhmm_mvad, interactive = FALSE,
    # automatic layout, legend on the right-hand side
    layout = layout_nicely, with.legend = "right",
    # Smaller and less curved edges
    edge.curved = 0.2, cex.edge.width = 0.5, edge.arrow.size = 0.7,
    vertex.label.pos = -4 * pi / 5, vertex.label.dist = 5)
}




