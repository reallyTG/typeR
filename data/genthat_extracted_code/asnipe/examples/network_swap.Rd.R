library(asnipe)


### Name: network_swap
### Title: Perform one (or more) random swap
### Aliases: network_swap

### ** Examples


# load data
data("group_by_individual")
data("times")

# subset GBI (to reduce run time of the example)
gbi <- gbi[,1:80]

# calculate network for data based on morning associations
network <- get_network(gbi, association_index="SRI", 
	times=times, start_time=0, end_time=max(times)/2)

# perform 100 permutations and calculate the coefficient
# of variance after each permutation.
# note that the subsetting is done outside of the function
library(raster)
cvs <- rep(NA,100)
network_perm = list(network,gbi[which(times <= max(times)/2),])
hours <- floor(times/3600)[which(times <= max(times)/2)]
for (i in 1:100) {
	network_perm <- network_swap(network_perm[[2]], swaps=1, 
		association_matrix=network_perm[[1]], days=hours, 
		within_day=TRUE)
	cvs[i] <- cv(network_perm[[1]])
}

# plot the results with the original network as a red dot
plot(cvs,pch=20,cex=0.5)
points(0,cv(network),cex=1,pch=20,col="red")




