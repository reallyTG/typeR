library(EnsCat)


### Name: enhcHi
### Title: Performs ensemble hierarchical clustering for high dimensional
###   categorical data
### Aliases: enhcHi
### Keywords: highdimension

### ** Examples

#data("rhabdodata")
### The following code generates the dissimilary matrix of sequence data stored in alphadata
### The ensemble has 100 member clusterings, and the number of clusters in each clustering
### is generated randomly from a discrete uniform on (2,10). A double bootstrap procedure is
### used to select a subset of variables for each clustering.
#ens<-enhcHi(rhabdodata$dat,En=100,len=c(2,10), type=2)
### Calculate the hamming distance
#dis0<-hammingD(ens)
### Save as distance format
#REDIST<-as.dist(dis0)
#hc0 <- hclust(REDIST,method = "average")
#plot(hc0,label=rhabdodata$lab,hang =-1)



