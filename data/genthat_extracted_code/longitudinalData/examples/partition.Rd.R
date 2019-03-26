library(longitudinalData)


### Name: partition
### Title: ~ Function: partition ~
### Aliases: partition partition,ANY,missing,ANY-method
###   partition,ANY,array,ANY-method partition,ANY,matrix,ANY-method
###   partition,ANY,LongData,ANY-method partition,ANY,LongData3d,ANY-method
###   partition,missing,missing,missing-method
### Keywords: cluster methods

### ** Examples

### Empty partition
partition()

### Small partition
partition(clusters=c("A","B","A","C","C"))

### Random partition
partition(clusters=LETTERS[floor(runif(100,1,5))])

### Partition that clusters correctly some data
###   Quality criterion are high
data(artificialLongData)
traj <- as.matrix(artificialLongData[,-1])
partition(clusters=rep(1:4,each=50),traj)

### Partition that does not cluster correctly the data
###   Quality criterion are low
partition(clusters=rep(1:4,50),traj)



