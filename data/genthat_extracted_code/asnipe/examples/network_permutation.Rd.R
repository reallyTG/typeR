library(asnipe)


### Name: network_permutation
### Title: Perform Permutation
### Aliases: network_permutation

### ** Examples


data("group_by_individual")
data("times")

# subset GBI (to reduce run time of the example)
gbi <- gbi[,1:80]

## define to 2 x N x N network to hold two association matrices
networks <- array(0, c(2, ncol(gbi), ncol(gbi)))

## calculate network for first half of the time
networks[1,,] <- get_network(gbi, data_format="GBI", 
	association_index="SRI", times=times, start_time=0, 
	end_time=max(times)/2)
networks[2,,] <- get_network(gbi, data_format="GBI",
	association_index="SRI", times=times, 
	start_time=max(times)/2, end_time=max(times))

## calculate the weighted degree
library(sna)
deg_weighted <- degree(networks,gmode="graph", g=c(1,2), ignore.eval=FALSE)

## perform the permutations constricting within hour of observation
## note permutations are limited to 10 to reduce runtime
network1_perm <- network_permutation(gbi, data_format="GBI",
	association_matrix=networks[1,,], times=times, start_time=0, 
	end_time=max(times)/2, days=floor(times/3600), within_day=TRUE,
	permutations=10)
network2_perm <- network_permutation(gbi, data_format="GBI",
	association_matrix=networks[2,,], times=times, 
	start_time=max(times)/2, end_time=max(times), days=floor(times/3600), within_day=TRUE,
	permutations=10)

## calculate the weighted degree for each permutation
deg_weighted_perm1 <- degree(network1_perm,gmode="graph", g=c(1:10), ignore.eval=FALSE)
deg_weighted_perm2 <- degree(network2_perm,gmode="graph", g=c(1:10), ignore.eval=FALSE)
detach(package:sna)

## plot the distribution of permutations with the original data overlaid
par(mfrow=c(1,2))
hist(colMeans(deg_weighted_perm1),breaks=100, 
	main=paste("P = ", 
	sum(mean(deg_weighted[,1]) < colMeans(deg_weighted_perm1))/ncol(deg_weighted_perm1)), 
	xlab="Weighted degree", ylab="Probability")
abline(v=mean(deg_weighted[,1]), col='red')
hist(colMeans(deg_weighted_perm2),breaks=100, 
	main=paste("P = ",
	sum(mean(deg_weighted[,2]) < colMeans(deg_weighted_perm2))/ncol(deg_weighted_perm2)), 
	xlab="Weighted degree", ylab="Probability")
abline(v=mean(deg_weighted[,2]), col='red')




