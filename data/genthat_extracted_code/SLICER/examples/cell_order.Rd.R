library(SLICER)


### Name: cell_order
### Title: Sort cells according to their progress through a process
### Aliases: cell_order

### ** Examples

genes=1:200
cells=sample(1:500,30)
data(traj)
k=10
traj_lle = lle::lle(traj[cells,genes],m=2,k)$Y
traj_graph = conn_knn_graph(traj_lle,5)
start=1
cells_ordered = cell_order(traj_graph,start)



