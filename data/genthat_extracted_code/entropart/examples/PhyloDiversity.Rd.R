library(entropart)


### Name: PhyloDiversity
### Title: Phylogenetic Diversity of a Community
### Aliases: PhyloDiversity bcPhyloDiversity PhyloDiversity.ProbaVector
###   PhyloDiversity.AbdVector PhyloDiversity.integer
###   PhyloDiversity.numeric is.PhyloDiversity summary.PhyloDiversity

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest
#      and their taxonomy)
data(Paracou618)
# Ps is the vector of probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ps)
# Calculate the phylogenetic Shannon diversity of the plot
summary(PhyloDiversity(Ps, 1, Paracou618.Taxonomy) -> d)
plot(d)

# Ns is the vector of abundances of the metacommunity
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Calculate the phylogenetic Shannon diversity of the plot
summary(bcPhyloDiversity(Ns, 1, Paracou618.Taxonomy, Correction = "Best") -> d)
plot(d)



