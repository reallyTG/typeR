library(entropart)


### Name: ShannonBeta
### Title: Shannon beta entropy of a community
### Aliases: ShannonBeta bcShannonBeta ShannonBeta.ProbaVector
###   ShannonBeta.AbdVector ShannonBeta.integer ShannonBeta.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ps is the vector of probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ps)
# Probability distribution of the first plot
Ps1 <- as.ProbaVector(Paracou618.MC$Psi[, 1])
# Shannon beta entropy of the plot
ShannonBeta(Ps1, Ps)

# Ns is the vector of abundances of the metacommunity
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Abundances in the first plot
Ns1 <- as.AbdVector(Paracou618.MC$Nsi[, 1])
# Reduced-bias estimator of Shannon beta entropy of the plot
bcShannonBeta(Ns1, Ns)



