library(sampling)


### Name: balancedcluster
### Title: Balanced cluster
### Aliases: balancedcluster
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of the clusters; there are 15 units in 3 clusters
cluster=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# selection of 2 clusters
s=balancedcluster(X,2,cluster,2,TRUE)
# the sample of clusters with the inclusion probabilities of the clusters
s
# the selected clusters
unique(cluster[s[,1]==1])
# the selected units 
(1:length(cluster))[s[,1]==1]
# with the probabilities
s[s[,1]==1,2]
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
s=balancedcluster(X,10,MU284$CL,1,TRUE)
cluster=MU284$CL
# the selected clusters
unique(cluster[s[,1]==1])
# the selected units 
(1:length(cluster))[s[,1]==1]
# with the probabilities
s[s[,1]==1,2]



