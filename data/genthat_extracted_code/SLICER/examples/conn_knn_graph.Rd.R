library(SLICER)


### Name: conn_knn_graph
### Title: Construct a k-nearest neighbor graph that is fully connected
### Aliases: conn_knn_graph

### ** Examples

genes=1:200
cells=sample(1:500,30)
k=10
traj_lle = lle::lle(traj[cells,genes],m=2,k)$Y
traj_graph = conn_knn_graph(traj_lle,5)



