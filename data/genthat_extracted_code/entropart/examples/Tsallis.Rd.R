library(entropart)


### Name: Tsallis
### Title: Tsallis (HCDT) Entropy of a community
### Aliases: Tsallis bcTsallis Tsallis.ProbaVector Tsallis.AbdVector
###   Tsallis.integer Tsallis.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)

# Calculate entropy of order 1, i.e. Shannon's entropy
Tsallis(Ps, 1)
# Calculate it with estimation bias correction
Tsallis(Ns, 1)



