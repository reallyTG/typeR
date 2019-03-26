library(SLICER)


### Name: find_extreme_cells
### Title: Identify candidate start cells for the trajectory
### Aliases: find_extreme_cells

### ** Examples

genes=1:200
cells=sample(1:500,30)
k=10
traj_lle = lle::lle(traj[cells,genes],m=2,k)$Y
traj_graph = conn_knn_graph(traj_lle,5)
find_extreme_cells(traj_graph,traj_lle)



