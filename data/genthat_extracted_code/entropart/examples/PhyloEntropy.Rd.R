library(entropart)


### Name: PhyloEntropy
### Title: Phylogenetic Entropy of a community
### Aliases: PhyloEntropy bcPhyloEntropy PhyloEntropy.ProbaVector
###   PhyloEntropy.AbdVector PhyloEntropy.integer PhyloEntropy.numeric
###   is.PhyloEntropy summary.PhyloEntropy

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest
#      and their taxonomy)
data(Paracou618)
# Ps is the vector of probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ps)
# Calculate the phylogenetic Shannon entropy of the plot
summary(PhyloEntropy(Ps, 1, Paracou618.Taxonomy) -> e)
plot(e)

# Ns is the vector of abundances of the metacommunity
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Calculate the phylogenetic Shannon entropy of the plot
summary(bcPhyloEntropy(Ns, 1, Paracou618.Taxonomy, Correction = "Best") -> e)
plot(e)



