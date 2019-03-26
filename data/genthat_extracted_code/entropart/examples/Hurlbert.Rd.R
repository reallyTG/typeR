library(entropart)


### Name: Hurlbert
### Title: Hurlbert's Index and Explicit Diversity
### Aliases: Hurlbert bcHurlbert Hurlbert.ProbaVector Hurlbert.AbdVector
###   Hurlbert.integer Hurlbert.numeric HurlbertD bcHurlbertD
###   HurlbertD.ProbaVector HurlbertD.AbdVector HurlbertD.integer
###   HurlbertD.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Species probabilities
Ps <- as.ProbaVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)

# Calculate Hurlbert entropy of order 2, equal to Simpson's index of diversity
Hurlbert(Ps, 2) 
# Calculate an unbiased estimator of Hurlbert entropy of order 2
Hurlbert(Ns, 2)



