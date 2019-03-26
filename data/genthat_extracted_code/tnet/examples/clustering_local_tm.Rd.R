library(tnet)


### Name: clustering_local_tm
### Title: Redefined local clusering coefficient for two-mode networks
### Aliases: clustering_local_tm

### ** Examples

# Weighted two-mode network
net <- cbind(
i=c(1,1,2,2,2,3,3,4,5,5,6),
p=c(1,2,1,3,4,2,3,4,3,5,5),
w=c(3,5,6,1,2,6,2,1,3,1,2))

## Run binary clustering function
clustering_local_tm(net[,1:2])

## Run weighted clustering function
clustering_local_tm(net)




