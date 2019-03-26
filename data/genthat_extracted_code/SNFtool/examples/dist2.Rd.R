library(SNFtool)


### Name: dist2
### Title: Pairwise squared Euclidean distances
### Aliases: dist2

### ** Examples


## Data1 is of size n x d_1, 
## where n is the number of patients, d_1 is the number of genes, 
## Data2 is of size n x d_2, 
## where n is the number of patients, d_2 is the number of methylation
data(Data1)
data(Data2)

## Calculate distance matrices(here we calculate Euclidean Distance, 
## you can use other distance, e.g. correlation)
Dist1 = dist2(as.matrix(Data1), as.matrix(Data1))
Dist2 = dist2(as.matrix(Data2), as.matrix(Data2))




