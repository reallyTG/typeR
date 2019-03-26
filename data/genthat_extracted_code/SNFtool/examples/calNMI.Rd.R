library(SNFtool)


### Name: calNMI
### Title: Mutual Information calculation
### Aliases: calNMI

### ** Examples


# How to use SNF with multiple views

# Load views into list "dataL"
data(dataL)
data(label)

# Set the other parameters
K = 20 # number of neighbours
alpha = 0.5 # hyperparameter in affinityMatrix
T = 20 # number of iterations of SNF

# Normalize the features in each of the views if necessary
# dataL = lapply(dataL, standardNormalization)

# Calculate the distances for each view
distL = lapply(dataL, function(x) (dist2(x, x))^(1/2))

# Construct the similarity graphs
affinityL = lapply(distL, function(x) affinityMatrix(x, K, alpha))

# Example of how to use SNF to perform subtyping
# Construct the fused network
W = SNF(affinityL, K, T)
# Perform clustering on the fused network.
clustering = spectralClustering(W,3);
# Use NMI to measure the goodness of the obtained labels.
NMI = calNMI(clustering,label);




