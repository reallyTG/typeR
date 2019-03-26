library(seqHMM)


### Name: build_mmm
### Title: Build a Mixture Markov Model
### Aliases: build_mmm

### ** Examples



# Define sequence data
data("mvad", package = "TraMineR")
mvad_alphabet <- c("employment", "FE", "HE", "joblessness", "school",
  "training")
mvad_labels <- c("employment", "further education", "higher education",
  "joblessness", "school", "training")
mvad_scodes <- c("EM", "FE", "HE", "JL", "SC", "TR")
mvad_seq <- seqdef(mvad, 17:86, alphabet = mvad_alphabet, states = mvad_scodes,
  labels = mvad_labels, xtstep = 6)

# Initialize the MMM
set.seed(123)
mmm_mvad <- build_mmm(observations = mvad_seq,
  n_clusters = 2,
  formula = ~male, data = mvad)

## Not run: 
##D # Estimate model parameters
##D mmm_mvad <- fit_model(mmm_mvad)$model
##D 
##D # Plot model (both clusters in the same plot)
##D require(igraph)
##D plot(mmm_mvad, interactive = FALSE,
##D   # Modify legend position and properties
##D   with.legend = "right", legend.prop = 0.3, cex.legend = 1.2,
##D   # Define vertex layout
##D   layout = layout_as_star,
##D   # Modify edge properties
##D   edge.label = NA, edge.arrow.size = 0.8, edge.curved = 0.2,
##D   # Modify vertex label positions (initial probabilities)
##D   vertex.label.pos = c("left", "right", "right", "left", "left", "right"))
##D   
##D # Summary of the MMM
##D summary(mmm_mvad)
## End(Not run)



