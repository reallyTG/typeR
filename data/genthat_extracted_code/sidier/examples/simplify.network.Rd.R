library(sidier)


### Name: simplify.network
### Title: Network showing modules as nodes
### Aliases: simplify.network

### ** Examples


inputMatrix<-matrix(c(1,1,1,1.2,2,1,0.8,1,3,2,1.2,1,4,2,2,2.2,
 5,3,1.8,2,6,3,2.2,2,7,3,1.7,2.1,8,3,2.2,2.2),ncol=4,byrow=TRUE)
colnames(inputMatrix)<-c("node","module","x","y")

network<-matrix(c(1,1,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,
  1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,1,1,
  1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,
  0,1,1,1,1),ncol=8)
colnames(network)<-c(1:8)
row.names(network)<-c(1:8)

i1<-0
simplify.network(node.names=inputMatrix[,1],modules=inputMatrix[,2],
coordinates=inputMatrix[,3:4],network=network,shift = i1,
bgcol=c("red","red","blue","blue","green","green","green","green"),
main=paste("shift=",i1))

i1<-0.5
simplify.network(node.names=inputMatrix[,1],modules=inputMatrix[,2],
coordinates=inputMatrix[,3:4],network=network,shift = i1,
bgcol=c("red","red","blue","blue","green","green","green","green"),
main=paste("shift=",i1))

i1<-1.0
simplify.network(node.names=inputMatrix[,1],modules=inputMatrix[,2],
coordinates=inputMatrix[,3:4],network=network,shift = i1,
bgcol=c("red","red","blue","blue","green","green","green","green"),
main=paste("shift=",i1))

network<-as.matrix(as.dist(matrix(sample(c(1,0),10000,replace=TRUE),ncol=100)))
inputMatrix<-matrix(nrow=100,ncol=4)
inputMatrix[,1]<-1:100
inputMatrix[,2]<-c(rep(1,30),rep(2,20),rep(3,20),rep(4,20),rep(5,10))
inputMatrix[,3]<-c(
sample(seq(-40,0,0.01),30,rep=TRUE),
sample(seq(-40,0,0.01),20,rep=TRUE),
sample(seq(0,40,0.01),20,rep=TRUE),
sample(seq(0,40,0.01),20,rep=TRUE),
sample(seq(-20,20,0.01),10,rep=TRUE))
inputMatrix[,4]<-c(
sample(seq(0,40,0.01),30,rep=TRUE),
sample(seq(-40,0,0.01),20,rep=TRUE),
sample(seq(0,40,0.01),20,rep=TRUE),
sample(seq(-40,0,0.01),20,rep=TRUE),
sample(seq(-20,20,0.01),10,rep=TRUE))
cols<-c("red","green","yellow","blue","turquoise")

simplify.network(node.names=inputMatrix[,1],network=network,shift=0,
coordinates=inputMatrix[,3:4],modules=inputMatrix[,2],bgcol=cols[inputMatrix[,2]])

simplify.network(node.names=inputMatrix[,1],network=network,shift=1,
coordinates=inputMatrix[,3:4],modules=inputMatrix[,2],bgcol=cols[inputMatrix[,2]])




