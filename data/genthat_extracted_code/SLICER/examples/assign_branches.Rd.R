library(SLICER)


### Name: assign_branches
### Title: Detect branches in the trajectory and assign cells to branches
### Aliases: assign_branches

### ** Examples

## Not run: 
##D traj_lle = lle::lle(traj[,genes],m=2,k)$Y
##D traj_graph = conn_knn_graph(traj_lle,5)
##D start=1
##D branches = assign_branches(traj_graph,start)
##D plot(traj_lle,pch=16,col=branches)
## End(Not run)



