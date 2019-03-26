library(SLICER)


### Name: graph_process_distance
### Title: Plot trajectory colored by process distance
### Aliases: graph_process_distance

### ** Examples

genes=1:200
cells=sample(1:500,30)
k=10
traj_lle = lle::lle(traj[cells,genes],m=2,k)$Y
traj_graph = conn_knn_graph(traj_lle,5)
start=1
graph_process_distance(traj_graph,traj_lle,start)



