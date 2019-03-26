library(PINSPlus)


### Name: PerturbationClustering
### Title: Perturbation clustering
### Aliases: PerturbationClustering

### ** Examples

## No test: 
# Load the dataset AML2004
data(AML2004)

# Perform the clustering
result <- PerturbationClustering(data = AML2004$Gene)

# Plot the result
condition = seq(unique(AML2004$Group[, 2]))
names(condition) <- unique(AML2004$Group[, 2])
plot(
    prcomp(AML2004$Gene)$x,
    col = result$cluster,
    pch = condition[AML2004$Group[, 2]],
    main = "AML2004"
)
legend(
    "bottomright",
    legend = paste("Cluster ", sort(unique(result$cluster)), sep = ""),
    fill = sort(unique(result$cluster))
)
legend("bottomleft", legend = names(condition), pch = condition)

# Change kmeans parameters
result <- PerturbationClustering(
    data = AML2004$Gene,
    clusteringMethod = "kmeans",
    clusteringOptions = list(
        iter.max = 500,
        nstart = 50
    )
)

# Change to use pam
result <- PerturbationClustering(data = AML2004$Gene, clusteringMethod = "pam")

# Change to use hclust
result <- PerturbationClustering(data = AML2004$Gene, clusteringMethod = "hclust")

# Pass a user-defined clustering algorithm
result <- PerturbationClustering(data = AML2004$Gene, clusteringFunction = function(data, k){
    # this function must return a vector of cluster
    kmeans(x = data, centers = k, nstart = k*10, iter.max = 2000)$cluster
})      

# Use noise as the perturb method
result <- PerturbationClustering(data = AML2004$Gene, 
                                 perturbMethod = "noise", 
                                 perturbOptions = list(noise = 0.3))
# or
result <- PerturbationClustering(data = AML2004$Gene, 
                                 perturbMethod = "noise", 
                                 perturbOptions = list(noisePercent = 10))

# Change to use subsampling
result <- PerturbationClustering(data = AML2004$Gene, 
                                 perturbMethod = "subsampling", 
                                 perturbOptions = list(percent = 90))

# Users can pass their own perturb method
result <- PerturbationClustering(data = AML2004$Gene, perturbFunction = function(data){
   rowNum <- nrow(data)
   colNum <- ncol(data)
   epsilon <-
       matrix(
           data = rnorm(rowNum * colNum, mean = 0, sd = 1.234),
           nrow = rowNum,
           ncol = colNum
       )
   
   list(
       data = data + epsilon,
       ConnectivityMatrixHandler = function(connectivityMatrix, ...) {
           connectivityMatrix
       },
       MergeConnectivityMatrices = function(oldMatrix, newMatrix, iter, ...){
           return((oldMatrix*(iter-1) + newMatrix)/iter)
       }
   )
})
## End(No test)



