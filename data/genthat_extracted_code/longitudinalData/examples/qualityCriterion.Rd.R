library(longitudinalData)


### Name: qualityCriterion
### Title: ~ Function: qualityCriterion ~
### Aliases: qualityCriterion qualityCriterion,matrix,ANY-method
###   qualityCriterion,array,ANY-method
###   qualityCriterion,LongData,Partition-method
###   qualityCriterion,LongData3d,Partition-method
### Keywords: package cluster methods

### ** Examples

##################
### Preparation of some artificial data
par(ask=TRUE)
data(artificialLongData)
ld <- longData(artificialLongData)


### Correct partition
part1 <- partition(rep(1:4,each=50))
plotTrajMeans(ld,part1)
(cr1 <- qualityCriterion(ld,part1))

### Random partition
part2 <- partition(floor(runif(200,1,5)))
plotTrajMeans(ld,part2)
(cr2 <- qualityCriterion(ld,part2))

### Partition with 3 clusters instead of 4
part3 <- partition(rep(c(1,2,3,3),each=50))
plotTrajMeans(ld,part3)
(cr3 <- qualityCriterion(ld,part3))


### Comparisons of the Partition
plot(c(cr1[[1]],cr2[[1]],cr3[[1]]),main="The highest give the best partition
(according to Calinski & Harabatz criterion)")
par(ask=FALSE)



