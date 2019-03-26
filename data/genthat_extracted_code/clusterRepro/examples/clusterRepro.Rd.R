library(clusterRepro)


### Name: clusterRepro
### Title: Gene expression clusters reproducibility and validation
### Aliases: clusterRepro
### Keywords: cluster

### ** Examples

### Generate centroids with annotated rows
Centroids <- matrix(rnorm(30, sd = 10), 10)
rownames(Centroids) <- letters[1:nrow(Centroids)]

### Generate data with annotated rows
Data <- cbind(matrix(rep(Centroids[,1], 10), 10),
matrix(rep(Centroids[,2], 15), 10), matrix(rep(Centroids[,3], 20), 10))
Data <- Data + matrix(rnorm(length(Data), sd = 10), nrow(Data))
rownames(Data) <- letters[1:nrow(Data)]

### Classify the data and calculate the corresponding in-group
### proportions and group size
Result <- clusterRepro(Centroids, Data, Number.of.permutations = 1)
Result$Actual.IGP
Result$Actual.Size

### Generate null distributions and compare to actual in-group proportions to obtain p-values
Result2 <- clusterRepro(Centroids, Data, Number.of.permutations = 1000)

### If the number of rows in the centroid matrix does not match the
### number of rows in the data matrix and the row labels are unique, this
### function will only use the rows that the two matrices have in common. 
Data <- matrix(rnorm(200), 20)
rownames(Data) <- letters[(nrow(Data)+6):7]
Result <- IGP.clusterRepro(Data, Centroids)
Result2 <- clusterRepro(Centroids, Data, Number.of.permutations = 1000)



