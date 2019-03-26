library(SNFtool)


### Name: concordanceNetworkNMI
### Title: Concordance Network NMI calculation
### Aliases: concordanceNetworkNMI

### ** Examples


# How to use SNF with multiple views

# Load views into list "dataL"
data(dataL)
data(label)

# Set the other parameters
K = 20 # number of neighbours
alpha = 0.5 # hyperparameter in affinityMatrix
T = 20 # number of iterations of SNF
# Normalize the features in each of the views.
#dataL = lapply(dataL, standardNormalization)

# Calculate the distances for each view
distL = lapply(dataL, function(x) (dist2(x, x)^(1/2)))

# Construct the similarity graphs
affinityL = lapply(distL, function(x) affinityMatrix(x, K, alpha))

# an example of how to use concordanceNetworkNMI
Concordance_matrix = concordanceNetworkNMI(affinityL, 3);

## The output, Concordance_matrix,
## shows the concordance between the fused network and each individual network. 




