library(ClustVarLV)


### Name: get_partition
### Title: Clusters of variables.
### Aliases: get_partition

### ** Examples

data(apples_sh)
resclvX <- CLV(X = apples_sh$senso, method = "directional", sX = TRUE)
parti4G<-get_partition(resclvX, K = 4) 




