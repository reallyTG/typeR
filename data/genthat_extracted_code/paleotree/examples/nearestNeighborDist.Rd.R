library(paleotree)


### Name: nearestNeighborDist
### Title: Nearest Neighbor Distances for Morphological Disparity Studies
### Aliases: nearestNeighborDist

### ** Examples

#example using graptolite disparity data from Bapst et al. 2012

#load data
data(graptDisparity)

#calculate mean NND
NND <- nearestNeighborDist(graptDistMat)
mean(NND)

#calculate NND for different groups

#group (clade/paraclade) coding
groupID <- graptCharMatrix[,54]+1

groupNND <- numeric(7)
names(groupNND) <- c("Normalo.","Monogr.","Climaco.",
   "Dicrano.","Lasiogr.","Diplogr.","Retiol.")
for(i in unique(groupID)){
   groupNND[i] <- mean(nearestNeighborDist(
      graptDistMat[groupID == i,groupID == i]))
   }
groupNND

#the paraphyletic Normalograptids that survived the HME are most clustered
   #but this looks at all the species at once
   #and doesn't look for the nearest *co-extant* neighbor!
   #need to bring in temporal info to test that




