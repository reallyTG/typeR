library(knnp)


### Name: knn_optim_parallelf
### Title: Parallel k and d optimization reading from files
### Aliases: knn_optim_parallelf

### ** Examples

knn_distances(AirPassengers, 1:3, file = "AirPassengers", cols = 2, threads = 2)
knn_optim_parallelf(AirPassengers, 1:5, 1:3, file = "AirPassengers", cols = 2, threads = 2)
knn_distances(LakeHuron, 1:6, file = "LakeHuron", cols = 10, threads = 2)
knn_optim_parallelf(LakeHuron, 1:10, 1:6, file = "LakeHuron", cols = 10, threads = 2)



