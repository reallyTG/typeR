library(seqHMM)


### Name: plot.hmm
### Title: Plot hidden Markov models
### Aliases: plot.hmm

### ** Examples

# Multichannel data, left-to-right model

# Loading a HMM of the biofam data
data("hmm_biofam")

# Plotting hmm object
plot(hmm_biofam)

# Plotting HMM with
plot(hmm_biofam,
  # varying curvature of edges
  edge.curved = c(0, -0.7, 0.6, 0.7, 0, -0.7, 0),
  # legend with two columns and less space
  ncol.legend = 2, legend.prop = 0.4,
  # new label for combined slice
  combined.slice.label = "States with probability < 0.05")

# Plotting HMM with given coordinates
plot(hmm_biofam,
  # layout given in 2x5 matrix
  # x coordinates in the first column
  # y coordinates in the second column
  layout = matrix(c(1, 3, 3, 5,  3,
                    0, 0, 1, 0, -1), ncol = 2),
  # larger vertices
  vertex.size = 50,
  # straight edges
  edge.curved = FALSE,
  # thinner edges and arrows
  cex.edge.width = 0.5, edge.arrow.size = 1,
  # varying positions for vertex labels (initial probabilities)
  vertex.label.pos = c(pi, pi/2, -pi/2, 0, pi/2),
  # different legend properties
  with.legend = "top", legend.prop = 0.3, cex.legend = 1.1,
  # Fix axes to the right scale
  xlim = c(0.5, 5.5), ylim = c(-1.5, 1.5), rescale = FALSE,
  # all states (not combining states with small probabilities)
  combine.slices = 0,
  # legend with two columns
  ncol.legend = 2)

# Plotting HMM with own color palette
plot(hmm_biofam, cpal = 1:10,
  # States with emission probability less than 0.2 removed
  combine.slices = 0.2,
  # legend with two columns
  ncol.legend = 2)

# Plotting HMM without pie graph and with a layout function
require("igraph")
# Setting the seed for a random layout
set.seed(1234)
plot(hmm_biofam,
  # Without pie graph
  pie = FALSE,
  # Using an automatic layout function from igraph
  layout = layout_nicely,
  vertex.size = 30,
  # Straight edges and probabilities of moving to the same state
  edge.curved = FALSE, loops = TRUE,
  # Labels with three significant digits
  label.signif = 3,
  # Fixed edge width
  edge.width = 1,
  # Remove edges with probability less than 0.01
  trim = 0.01,
  # Hidden state names as vertex labels
  vertex.label = "names",
  # Labels insidde vertices
  vertex.label.dist = 0,
  # Fix x-axis (more space on the right-hand side)
  xlim = c(-1, 1.3))


# Single-channel data, unrestricted model

# Loading a hidden Markov model of the mvad data (hmm object)
data("hmm_mvad")

# Plotting HMM
plot(hmm_mvad)

require("igraph")
plot(hmm_mvad,
  # Layout in circle (layout function from igraph)
  layout = layout_in_circle,
  # Less curved edges with smaller arrows, no labels
  edge.curved = 0.2, edge.arrow.size = 0.9, edge.label = NA,
  # Positioning vertex labels (initial probabilities)
  vertex.label.pos = c("right", "right", "left", "left", "right"),
  # Less space for the legend
  legend.prop = 0.3)



