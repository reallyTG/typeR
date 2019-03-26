library(entropart)


### Name: SimpsonBeta
### Title: Simpson beta entropy of a community
### Aliases: SimpsonBeta bcSimpsonBeta SimpsonBeta.ProbaVector
###   SimpsonBeta.AbdVector SimpsonBeta.integer SimpsonBeta.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ps is the vector of probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ps)
# Probability distribution of the first plot
Ps1 <- as.ProbaVector(Paracou618.MC$Psi[, 1])

# Simpson beta entropy of the plot
SimpsonBeta(Ps1, Ps)
# Transform into diversity
expq(SimpsonBeta(Ps1, Ps)/(1-Simpson(Ps1)), 2)

# Ns is the vector of abundances of the metacommunity
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Abundances in the first plot
Ns1 <- as.AbdVector(Paracou618.MC$Nsi[, 1])
# Reduced-bias Shannon beta entropy of the plot
bcSimpsonBeta(Ns1, Ns)



