library(entropart)


### Name: Rao
### Title: Rao Quadratic Entropy of a Community
### Aliases: Rao bcRao Rao.ProbaVector Rao.AbdVector Rao.integer
###   Rao.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Calculate Rao's quadratic entropy of the plot
Rao(Ps, Paracou618.Taxonomy)



