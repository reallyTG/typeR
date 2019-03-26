library(longitudinalData)


### Name: plotAllCriterion
### Title: ~ Function: plotAllCriterion ~
### Aliases: plotAllCriterion plotAllCriterion-method
###   plotAllCriterion,ListPartition plotAllCriterion,ListPartition-method

### ** Examples

###############
### Data generation
data(artificialLongData)
traj <- as.matrix(artificialLongData[,-1])

### Some clustering
listPart <- listPartition()
listPart["add"] <- partition(rep(c("A","B"),time=100),traj)
listPart["add"] <- partition(rep(c("A","B","B","B"),time=50),traj)
listPart["add"] <- partition(rep(c("A","B","C","A"),time=50),traj)
listPart["add"] <- partition(rep(c("A","B","C","D"),time=50),traj)
ordered(listPart)

################
### graphical display
plotAllCriterion(listPart)
plotAllCriterion(listPart,criterion=CRITERION_NAMES[1:5],TRUE)



