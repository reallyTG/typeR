library(PCDSpline)


### Name: BladTumor
### Title: Bladder Tumor Cancer Data
### Aliases: BladTumor
### Keywords: datasets

### ** Examples

data(BladTumor)

n<-max(BladTumor$subject)
#record the number of observations for all patients
k<-as.numeric(table(BladTumor$subject))   
K<-max(k)
t<-matrix(,n,K)
z<-matrix(,n,K)

x1<-c();x2<-c();x3<-c();x4<-c();

for (r in 1:n){
rownum<-which(BladTumor$subject==r)
#record all observation times
t[r,][1:k[r]]<-BladTumor[rownum,]$time    
#record all panel counts from non-overlapping intervals
z[r,][1:k[r]]<-BladTumor[rownum,]$count1  
x1[r]<-BladTumor[which(BladTumor$subject==r),]$number[1]
x2[r]<-BladTumor[which(BladTumor$subject==r),]$size[1]
x3[r]<-BladTumor[which(BladTumor$subject==r),]$pyridoxine[1];
x4[r]<-BladTumor[which(BladTumor$subject==r),]$thiotepa[1]
}

x<-cbind(x1,x2,x3,x4)
BladTumor1<-list(t=t,x=x,z=z,k=k,K=K)



