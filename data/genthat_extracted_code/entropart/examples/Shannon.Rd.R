library(entropart)


### Name: Shannon
### Title: Shannon entropy of a community
### Aliases: bcShannon Shannon Shannon.ProbaVector Shannon.AbdVector
###   Shannon.integer Shannon.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)

# Calculate Shannon entropy
Shannon(Ps)

# Calculate the best estimator of Shannon entropy
Shannon(Ns)

# Use metacommunity data to calculate reduced-bias Shannon beta as mutual information
(bcShannon(Paracou618.MC$Ns) + bcShannon(colSums(Paracou618.MC$Nsi))
- bcShannon(Paracou618.MC$Nsi))



