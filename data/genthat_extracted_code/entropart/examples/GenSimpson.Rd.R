library(entropart)


### Name: GenSimpson
### Title: Generalized Simpson's Entropy and Diversity
### Aliases: GenSimpson bcGenSimpson GenSimpson.ProbaVector
###   GenSimpson.AbdVector GenSimpson.integer GenSimpson.numeric
###   GenSimpsonD bcGenSimpsonD GenSimpsonD.ProbaVector
###   GenSimpsonD.AbdVector GenSimpsonD.integer GenSimpsonD.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)

# Calculate GenSimpson entropy of order 1, equal to Simpson's index of diversity
GenSimpson(Ps, 1) 
# Calculate an unbiased estimator of GenSimpson diversity of order 100
GenSimpsonD(Ns, 100)



