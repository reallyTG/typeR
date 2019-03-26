library(M2SMF)


### Name: new_modularity
### Title: Calculate the modularity
### Aliases: new_modularity

### ** Examples


WL <- simu_data_gen()
WL[[1]] <- affinityMatrix(dist2eu(Standard_Normalization(WL[[1]]),Standard_Normalization(WL[[1]])))
WL[[2]] <- affinityMatrix(dist2eu(Standard_Normalization(WL[[2]]),Standard_Normalization(WL[[2]])))
new_WL_list <- initialize_WL(WL)
init_list <- initialization(new_WL_list,5)
res <- M2SMF(WL,0.25,10^-4,5)
init_list <- res[[1]]
modularity <- new_modularity(init_list,WL)



