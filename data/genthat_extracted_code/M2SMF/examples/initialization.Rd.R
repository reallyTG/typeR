library(M2SMF)


### Name: initialization
### Title: initialize the sub-matrix Ci into alpha*Li by SVD
### Aliases: initialization

### ** Examples


WL <- simu_data_gen()
new_WL_list <- initialize_WL(WL)
k <- 5
init_list <- initialization(new_WL_list,k)



