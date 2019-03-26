library(M2SMF)


### Name: affinityMatrix
### Title: To calculate the similarity matrix
### Aliases: affinityMatrix

### ** Examples


data_list <- simu_data_gen()
Diff <- dist2eu(Standard_Normalization(data_list[[1]]),Standard_Normalization(data_list[[1]]))
simi <- affinityMatrix(Diff,20,0.5)



