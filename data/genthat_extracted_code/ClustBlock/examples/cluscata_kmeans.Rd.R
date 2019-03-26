library(ClustBlock)


### Name: cluscata_kmeans
### Title: Compute the CLUSCATA partitionning algorithm on different blocks
###   of binary variables from a CATA experiment. Can be performed using a
###   multi start strategy or initial partition provided by the user
### Aliases: cluscata_kmeans
### Keywords: CATA

### ** Examples

data(straw)
cl_km=cluscata_kmeans(Data=straw[,1:(16*40)], nblo=40, clust=3)
plot(cl_km, Graph_groups=FALSE)
summary(cl_km)




