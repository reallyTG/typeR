library(longitudinalData)


### Name: ordered(ListPartition)
### Title: ~ Function: ordered(ListPartition) ~
### Aliases: ordered ordered,ListPartition ordered,ListPartition-method
### Keywords: methods

### ** Examples

##############
### Preparing data
data(artificialLongData)
traj <- as.matrix(artificialLongData[,-1])

### Some clustering
part2 <- partition(rep(c("A","B"),time=100),traj)
part3 <- partition(rep(c("A","B","C","A"),time=50),traj)
part3b <- partition(rep(c("A","B","C","B"),time=50),traj)
part4 <- partition(rep(c("A","B","C","D"),time=50),traj)


################
### ListPartition
listPart <- listPartition()
listPart['criterionActif'] <-"Davies.Bouldin"
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

listPart['criterionActif'] <-"Calinski.Harabatz"
plotCriterion(listPart)
ordered(listPart)
plotCriterion(listPart)





