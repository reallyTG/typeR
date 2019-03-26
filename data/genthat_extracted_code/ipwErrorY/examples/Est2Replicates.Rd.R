library(ipwErrorY)


### Name: Est2Replicates
### Title: Estimation of ATE with Two Replicates
### Aliases: Est2Replicates

### ** Examples

#create a dataset with sensitivity=0.95 and specificity=0.85
set.seed(100)
X1=rnorm(2000)   
A=rbinom(2000,1,1/(1+exp(-0.2-X1)))
Y=rbinom(2000,1,1/(1+exp(-0.2-A-X1)))
y1=which(Y==1)
y0=which(Y==0) 
Yast1=Y
Yast1[y1]=rbinom(length(y1),1,0.95)
Yast1[y0]=rbinom(length(y0),1,0.15)
Yast2=Y
Yast2[y1]=rbinom(length(y1),1,0.95)  
Yast2[y0]=rbinom(length(y0),1,0.15)
da=data.frame(A=A,X1=X1,Yast1=Yast1,Yast2=Yast2)
head(da)
#apply the correction method assuming specificity=0.85
Est2Replicates(da,"A",c("Yast1","Yast2"),"X1","known specificity",NULL,0.85,NULL,0.95)




