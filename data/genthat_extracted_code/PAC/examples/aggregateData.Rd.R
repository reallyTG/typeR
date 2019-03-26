library(PAC)


### Name: aggregateData
### Title: Aggregates results from the clustering and merging step.
### Aliases: aggregateData

### ** Examples

n = 5e3                       # number of observations
p = 1                         # number of dimensions
K = 3                         # number of clusters
w = rep(1,K)/K                # component weights
mu <- c(0,2,4)                # component means
sd <- rep(1,K)/K              # component standard deviations
g <- sample(1:K,prob=w,size=n,replace=TRUE)   # ground truth for clustering
X <- as.matrix(rnorm(n=n,mean=mu[g],sd=sd[g]))
y <- PAC(X, K)
X2<-as.matrix(rnorm(n=n,mean=mu[g],sd=sd[g]))
y2<-PAC(X2,K)
X<-cbind("Sample1", as.data.frame(X)); colnames(X)<-c("SampleID", "Value")
X2<-cbind("Sample2", as.data.frame(X2)); colnames(X2)<-c("SampleID", "Value")
aggregateData(rbind(X,X2),c(y,y2))



