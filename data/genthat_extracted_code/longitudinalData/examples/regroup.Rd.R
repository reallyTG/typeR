library(longitudinalData)


### Name: regroup
### Title: ~ Function: regroup ~
### Aliases: regroup
### Keywords: classes cluster ts

### ** Examples

### Some data
data(artificialLongData)
myLd <- as.matrix(artificialLongData[,-1])
### Some clustering
part2 <- partition(rep(c("A","B","A","C"),time=50),myLd)
part3 <- partition(rep(c("A","B","C","D"),time=50),myLd)

################
### ListPartition
listPart <- listPartition()

listPart["add"] <- part2
listPart["add"] <- part3
listPart["add"] <- part2
listPart["add"] <- part3

### Some clustering has been found several time
### regroup will suppress the duplicate one
regroup(listPart)
plotCriterion(listPart)



