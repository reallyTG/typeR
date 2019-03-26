library(qclust)


### Name: Qclust
### Title: Robust Estimation of Gaussian Mixture Models
### Aliases: Qclust

### ** Examples

n = 200
set.seed(12345)
true_para=list()
true_para$pro=rep(1/3,3)
true_para$mean=matrix(c(-6,1.5,0,0,6,1.5),2,3)
true_para$variance$sigma=array(c(5,4,4,5,5,-4,-4,5,1.56,0,0,1.56),dim=c(2,2,3))
G=ncol(true_para$mean)
z = sample(1:G,n,true_para$pro,replace=TRUE)
z = sort(z)
X=matrix(NA,n,nrow(true_para$mean))
for (i in 1:G)
{
  X[z==i,]=rmvnorm(sum(z==i),true_para$mean[,i],true_para$variance$sigma[,,i])
}
plot(X,pch=20)
qfit=Qclust(X,K=3,modelNames="VVV",q=0.9)
plot(qfit,what="classification")



