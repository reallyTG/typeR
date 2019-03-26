library(DBHC)


### Name: hmm.clust
### Title: DBHC Algorithm
### Aliases: hmm.clust

### ** Examples

## Simulated data
library(seqHMM)
output.labels <-  c("H", "T")

# HMM 1
states.1 <- c("A", "B", "C")
transitions.1 <- matrix(c(0.8,0.1,0.1,0.1,0.8,0.1,0.1,0.1,0.8), nrow = 3)
rownames(transitions.1) <- states.1
colnames(transitions.1) <- states.1
emissions.1 <- matrix(c(0.5,0.75,0.25,0.5,0.25,0.75), nrow = 3)
rownames(emissions.1) <- states.1
colnames(emissions.1) <- output.labels
initials.1 <- c(1/3,1/3,1/3)

# HMM 2
states.2 <- c("A", "B")
transitions.2 <- matrix(c(0.75,0.25,0.25,0.75), nrow = 2)
rownames(transitions.2) <- states.2
colnames(transitions.2) <- states.2
emissions.2 <- matrix(c(0.8,0.6,0.2,0.4), nrow = 2)
rownames(emissions.2) <- states.2
colnames(emissions.2) <- output.labels
initials.2 <- c(0.5,0.5)

# Simulate
hmm.sim.1 <- simulate_hmm(n_sequences = 100,
                          initial_probs = initials.1,
                          transition_probs = transitions.1,
                          emission_probs = emissions.1,
                          sequence_length = 25)
hmm.sim.2 <- simulate_hmm(n_sequences = 100,
                          initial_probs = initials.2,
                          transition_probs = transitions.2,
                          emission_probs = emissions.2,
                          sequence_length = 25)
sequences <- rbind(hmm.sim.1$observations, hmm.sim.2$observations)
n <- nrow(sequences)

# Clustering algorithm
id <- paste0("K-", 1:n)
rownames(sequences) <- id
sequences <- sequences[sample(1:n, n),]
## No test: 
res <- hmm.clust(sequences, id = rownames(sequences))
## End(No test)


#############################################################################

## Swiss Household Data
data("biofam", package = "TraMineR")

# Clustering algorithm
new.alphabet <- c("P", "L", "M", "LM", "C", "LC", "LMC", "D")
sequences <- seqdef(biofam[,10:25], alphabet = 0:7, states = new.alphabet)
## Not run: 
##D res <- hmm.clust(sequences)
##D 
##D # Heatmaps
##D cluster <- 1  # display heatmaps for cluster 1
##D transition.heatmap(res$partition[[cluster]]$transition_probs,
##D                    res$partition[[cluster]]$initial_probs)
##D emission.heatmap(res$partition[[cluster]]$emission_probs)
## End(Not run)


## A smaller example, which takes less time to run
## No test: 
subset <- sequences[sample(1:nrow(sequences), 20, replace = FALSE),]

# Clustering algorithm, limiting number of clusters to 2
res <- hmm.clust(subset, K.max = 2)

# Number of clusters
print(res$n.clusters)

# Table of cluster memberships
table(res$memberships[,"cluster"])

# BIC for each number of clusters
print(res$bic)

# Heatmaps
cluster <- 1  # display heatmaps for cluster 1
transition.heatmap(res$partition[[cluster]]$transition_probs,
                   res$partition[[cluster]]$initial_probs)
emission.heatmap(res$partition[[cluster]]$emission_probs)
## End(No test)

## Don't show: 
subset <- sequences[sample(1:nrow(sequences), 4, replace = FALSE),]

# Clustering algorithm, limiting number of clusters to 2
res <- hmm.clust(subset, K.max = 2, seed.size = 2)
## End(Don't show)



