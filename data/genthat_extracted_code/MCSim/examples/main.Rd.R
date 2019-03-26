library(MCSim)


### Name: MCS
### Title: MCSim: a Package to Determine the Optimal Number of Clusters
### Aliases: MCS
### Keywords: Number of clusters Clustering algorithm Similarity index Rand
###   index Jaccard index Correction for chance agreement Validity index

### ** Examples

library("MASS")
library("CircStats")
library("stats")
library("datasets")
library("graphics")
########  Simulated data from four bivariate normal distributions
set.seed(12345)
clust1<- mvrnorm(100,mu=c(5,5),Sigma=matrix(c(1,0.5,0.5,1),ncol=2))
clust2<- mvrnorm(100,mu=c(5,20),Sigma=matrix(c(1,0.5,0.5,1),ncol=2))
clust3<- mvrnorm(100,mu=c(20,5),Sigma=matrix(c(1,0.5,0.5,1),ncol=2))
clust4<- mvrnorm(100,mu=c(20,20),Sigma=matrix(c(1,0.5,0.5,1),ncol=2))
simdat<- rbind(clust1,clust2,clust3,clust4)

MCS(data1=simdat, nc=10, method1="single", method2="ward.D2", index="rand", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)

MCS(data1=simdat, nc=10, method1="kmeans", method2="single", index="rand", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)
####################################################
## Data from three bivariate normal distributions (elongated clusters)
set.seed(1965)
clust1<- mvrnorm(100,mu=c(5,5),Sigma=matrix(c(1,0.9,0.9,1),ncol=2))
clust2<- mvrnorm(100,mu=c(5,20),Sigma=matrix(c(1,0.9,0.9,1),ncol=2))
clust3<- mvrnorm(100,mu=c(20,5),Sigma=matrix(c(1,0.9,0.9,1),ncol=2))
simdat<- rbind(clust1,clust2,clust3)

MCS(data1=simdat, nc=10, method1="complete", method2="average", index="rand", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)

MCS(data1=simdat, nc=10, method1="median", method2="kmeans", index="rand", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)
####################################################
##  Old Faithful Geyser Data Example  #######
library("datasets")
data1<- as.matrix(faithful,nrows=272,ncol=2,byrows=TRUE)

MCS(data1=data1, nc=10, method1="average", method2="ward.D2", index="rand", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)

MCS(data1=data1, nc=10, method1="average", method2="kmeans", index="jaccard", print.stats=TRUE,
st.data=FALSE, plot.hc=FALSE)
## Simulated Circular data from five von Mises distributions ####
set.seed(1945)
clust1<- as.vector(rvm(50,5,15))
clust2<- as.vector(rvm(50,10,15))
clust3<- as.vector(rvm(50,15,15))
clust4<- as.vector(rvm(50,20,15))
clust5<- as.vector(rvm(50,25,15))
data1<- rbind(clust1,clust2,clust3,clust4,clust5)
MCS(data1=data1, nc=10, method1="kmeans", method2="complete", index="rand", print.stats=TRUE,
circ=TRUE, convert=FALSE, plot.data=FALSE)
### Turtles Data Example
turtles<- c(8,9,13,13,14,18,22,27,30,34,
38,38,40,44,45,47,48,48,48,48,50,53,56,
57,58,58,61,63,64,64,64,65,65,68,70,73,
78,78,78,83,83,88,88,88,90,92,92,93,95,
96,98,100,103,106,113,118,138,153,153,
155,204,215,223,226,237,238,243,244,250,
251,257,268,285,319,343,350)

MCS(data1=turtles, nc=10, method1="single", method2="ward.D2", index="rand", print.stats=TRUE,
circ=TRUE, convert=TRUE, plot.data=FALSE)

MCS(data1=turtles, nc=10, method1="ward.D2", method2="kmeans", index="jaccard", print.stats=TRUE,
circ=TRUE, convert=TRUE, plot.data=FALSE)
######  Wind data example  ##
wind<- c(67,87,101,101,101,103,131,140,140,142,144,149,182,
199,206,251,253,278,279,287,290,295,299,301,301,307,308,308,
309,310,312,316,319,319,325,325,326,331,344,15)

MCS(data1=wind, nc=10, method1="ward.D2", method2="median", index="jaccard", print.stats=TRUE,
circ=TRUE, convert=TRUE, plot.data=FALSE)

MCS(data1=wind, nc=10, method1="complete", method2="average", index="jaccard", print.stats=TRUE,
circ=TRUE, convert=TRUE, plot.data=FALSE)



