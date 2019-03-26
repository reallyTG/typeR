library(longitudinalData)


### Name: Partition-class
### Title: ~ Class: Partition ~
### Aliases: Partition-class [,Partition-method [<-,Partition-method
###   show,Partition-method is.na,Partition-method
### Keywords: classes cluster

### ** Examples

############
### Building Partition

### number
part <- partition(rep(c(1,2,1,3),time=3))

### LETTERS
part <- partition(rep(c("A","B","D"),time=4),details=c(convergenceTime="3",multiplicity="1"))

### Others don't work
try(partition(rep(c("A","Bb","C"),time=3)))

#############
### Setteur and Getteur

### '['
part["clusters"]
part["clustersAsInteger"]
part["nbClusters"]

### '[<-'
part["multiplicity"] <- 2
(part)



