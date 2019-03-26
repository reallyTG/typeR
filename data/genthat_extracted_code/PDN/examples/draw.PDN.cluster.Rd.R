library(PDN)


### Name: draw.PDN.cluster
### Title: Draw Personalized Disease Network for cluster of patients
### Aliases: draw.PDN.cluster

### ** Examples

#Select a subset of data for toy example
comorbidity_data = comorbidity_data[c(1:10),]
survival_data = survival_data[c(1:10),]
##Clustering Example
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
a = buildnetworks(comorbidity_data,k1)
datark = t(apply(comorbidity_data,1,rank))
require(survival)
zsq = NULL
for(i in 1:ncol(a)){
  a1 = (summary(coxph(Surv(as.numeric(survival_data[,1]),survival_data[,2]) ~ a[,i],
  data=as.data.frame(a)))$coefficient[,4])^2
  zsq = cbind(zsq,a1)
}
zsq = as.numeric(zsq)
wi=zsq/sum(zsq,na.rm=TRUE)
wi[wi<10^ -3]=10^ -3
wi[is.na(wi)]=10^ -3
#weighted matrix
wa = NULL
for(i in 1:ncol(a)){
 wa = cbind(wa,a[,i]*wi[i])
}
#PCA
pr.out=prcomp(wa)
x.svd=svd(wa)
x.score1 <- wa %*% x.svd$v
x.score2 <- x.svd$u %*% diag(x.svd$d)
##HC cluster using the first 8 PCA scores
dp<-dist(x.score2[,1:8])
hcp<-hclust(dp, method="ward.D")
##Plot Network
s1=rev(sort(apply(a[cutree(hcp,3)==2,],2,mean)))[1:50]
dak = sort(apply(datark[cutree(hcp,3)==2,],2,mean,na.rm=TRUE))
names(dak) = unlist(strsplit(names(dak),"DAT"))
draw.PDN.cluster(s1,dak)



