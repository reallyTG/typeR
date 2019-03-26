library(clusterSim)


### Name: speccl
### Title: A spectral clustering algorithm
### Aliases: speccl
### Keywords: spectral clustering, cluster analysis, scales of measurement

### ** Examples

# Commented due to long execution time
# Example 1
#library(clusterSim)
#library(mlbench)
#data<-mlbench.spirals(100,1,0.03)
#plot(data)
#x<-data$x
#res1<-speccl(x,nc=2,distance="GDM1",sigma="automatic",
#sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
#clas1<-res1$cluster
#print(data$classes)
#print(clas1)
#cRand<-classAgreement(table(as.numeric(as.vector(data$classes)),
#res1$clusters))$crand
#print(res1$sigma)
#print(cRand)

# Example 2
#library(clusterSim)
#grnd2<-cluster.Gen(50,model=4,dataType="m",numNoisyVar=1)
#data<-as.matrix(grnd2$data)
#colornames<-c("red","blue","green")
#grnd2$clusters[grnd2$clusters==0]<-length(colornames)
#plot(grnd2$data,col=colornames[grnd2$clusters])
#us<-nrow(data)*nrow(data)/2
#res2<-speccl(data,nc=3,distance="sEuclidean",sigma="automatic",
#sigma.interval=us,mod.sample=0.75,R=10,iterations=3)
#cRand<-comparing.Partitions(grnd2$clusters,res2$clusters,type="crand")
#print(res2$sigma)
#print(cRand)

# Example 3
#library(clusterSim)
#grnd3<-cluster.Gen(40,model=4,dataType="o",numCategories=7)
#data<-as.matrix(grnd3$data)
#plotCategorial(grnd3$data,pairsofVar=NULL,cl=grnd3$clusters,
#clColors=c("red","blue","green"))
#res3<-speccl(data,nc=3,distance="GDM2",sigma="automatic",
#sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
#cRand<-comparing.Partitions(grnd3$clusters,res3$clusters,type="crand")
#print(res3$sigma)
#print(cRand)

# Example 4
library(clusterSim)
data(data_nominal)
res4<-speccl(data_nominal,nc=4,distance="SM",sigma="automatic",
sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
print(res4)




