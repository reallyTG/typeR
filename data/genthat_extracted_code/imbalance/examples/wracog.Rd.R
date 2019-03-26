library(imbalance)


### Name: wracog
### Title: Wrapper for rapidly converging Gibbs algorithm.
### Aliases: wracog

### ** Examples

data(haberman)

# Create train and validation partitions of haberman
trainFold <- sample(1:nrow(haberman), nrow(haberman)/2, FALSE)
trainSet <- haberman[trainFold, ]
validationSet <- haberman[-trainFold, ]

# Defines our own wrapper with a C5.0 tree
myWrapper <- structure(list(), class="TestWrapper")
trainWrapper.TestWrapper <- function(wrapper, train, trainClass){
  C50::C5.0(train, trainClass)
}

# Execute wRACOG with our own wrapper
newSamples <- wracog(trainSet, validationSet, myWrapper,
                     classAttr = "Class")


# Execute wRACOG with predifined wrappers for "KNN" or "C5.0"
KNNSamples <- wracog(trainSet, validationSet, "KNN")
C50Samples <- wracog(trainSet, validationSet, "C5.0")




