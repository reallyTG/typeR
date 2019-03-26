library(M2SMF)


### Name: cost
### Title: Calculate the cost
### Aliases: cost

### ** Examples


WL <- simu_data_gen()
WL[[1]] <- affinityMatrix(dist2eu(Standard_Normalization(WL[[1]]),Standard_Normalization(WL[[1]])))
WL[[2]] <- affinityMatrix(dist2eu(Standard_Normalization(WL[[2]]),Standard_Normalization(WL[[2]])))
new_WL_list <- initialize_WL(WL)
k <- 5
lambda <- 0.25
init_list <- initialization(new_WL_list,k)
update_L_list <- update_L(new_WL_list,init_list)
update_alpha_list <- update_alpha(new_WL_list,update_L_list,lambda)
init_list <- update_alpha_list
new_loss <- cost(new_WL_list,init_list,lambda)



