library(SLICER)


### Name: process_distance
### Title: Determine the position of each cell within the trajectory
### Aliases: process_distance

### ** Examples

genes=1:200
cells=sample(1:500,30)
k=10
traj_lle = lle::lle(traj[cells,genes],m=2,k)$Y
traj_graph = conn_knn_graph(traj_lle,5)
start = 1
dists = process_distance(traj_graph,start)



