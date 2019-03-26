library(entropart)


### Name: Diversity
### Title: HCDT diversity of a community
### Aliases: Diversity bcDiversity Diversity.ProbaVector
###   Diversity.AbdVector Diversity.integer Diversity.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)
# Calculate diversity of order 1, i.e. Shannon's diversity
Diversity(Ps, 1)
# Calculate it with estimation bias correction
Diversity(Ns, 1)



