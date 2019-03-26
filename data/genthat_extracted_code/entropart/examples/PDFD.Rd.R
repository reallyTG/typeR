library(entropart)


### Name: PDFD
### Title: Phylogenetic Diversity / Functional Diversity of a Community
### Aliases: PDFD

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest
#      and their taxonomy)
data(Paracou618)
# Ps is the vector of probabilities
Ps <- Paracou618.MC$Ps
# Calculate the phylogenetic Shannon diversity of the plot
PDFD(Ps, Paracou618.Taxonomy)



