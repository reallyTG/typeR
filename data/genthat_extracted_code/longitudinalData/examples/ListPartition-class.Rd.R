library(longitudinalData)


### Name: ListPartition-class
### Title: ~ Class: ListPartition ~
### Aliases: ListPartition ListPartition-class [,ListPartition-method
###   [,ListPartition-methods [,ListPartition-ANY,ANY,ANY
###   [,ListPartition-ANY,ANY,ANY-method
###   [,ListPartition-ANY,ANY,ANY-methods [<-,ListPartition-method
###   [<-,ListPartition-ANY,ANY,ANY ListPartition_show
###   show,ListPartition-method listPartition listPartition-method
### Keywords: classes cluster ts

### ** Examples

##############
### Preparing data
data(artificialLongData)
traj <- as.matrix(artificialLongData[,-1])

### Some clustering
part2 <- partition(rep(c("A","B"),time=100),traj)
part3 <- partition(rep(c("A","B","C","A"),time=50),traj)
part3b <- partition(rep(c("A","B","C","B","C"),time=40),traj)
part4 <- partition(rep(c("A","B","A","C","D"),time=40),traj)


################
### ListPartition
listPart <- listPartition()
plotCriterion(listPart)

listPart["add"] <- part2
listPart["add"] <- part3
listPart["add"] <- part3b
listPart["add"] <- part4
listPart["add"] <- part4
listPart["add"] <- part3
listPart["add"] <- part3b

plotCriterion(listPart)
ordered(listPart)
plotCriterion(listPart)
regroup(listPart)
plotCriterion(listPart)
plotAllCriterion(listPart)



