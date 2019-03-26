library(forestSAS)


### Name: nnid
### Title: Find the id of nearest neighbour for each point.
### Aliases: nnid

### ** Examples

library(spatstat)
data(finpines)
#Find the id of the nearest neighbour in a certain numbers and without id
finpines.rmidN4<-nnid(finpines,id=paste("T",1:finpines$n),N=4)
finpines.rmidN4

#Find the id of the nearest neighbour in a certain numbers with id
finpines.idN4<-nnid(finpines,id=paste("T",1:finpines$n),N=4,exclude=FALSE)
finpines.idN4

#Find the id of the nearest neighbour within a certain radius without id
data(tree.ppp)
finpines.rmidR0.5<-nnid(tree.ppp,id=paste("T",1:41),R=0.5)
finpines.rmidR0.5

#Find the id of the nearest neighbour within a certain radius with id
finpines.idR0.5<-nnid(tree.ppp,id=paste("T",1:41),R=0.5,exclude=FALSE)
finpines.idR0.5



