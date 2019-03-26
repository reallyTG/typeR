library(entropart)


### Name: Simpson
### Title: Simpson entropy of a community
### Aliases: Simpson bcSimpson Simpson.ProbaVector Simpson.AbdVector
###   Simpson.integer Simpson.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Whittaker plot
plot(Ns)

# Calculate an unbiased estimator of Simpson's index of diversity
Simpson(Ns)



