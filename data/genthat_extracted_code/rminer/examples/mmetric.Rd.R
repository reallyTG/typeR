library(rminer)


### Name: mmetric
### Title: Compute classification or regression error metrics.
### Aliases: mmetric metrics
### Keywords: classif regression

### ** Examples

### regression examples: y - desired values; x - predictions
y=c(95.01,96.1,97.2,98.0,99.3,99.7);x=95:100
print(mmetric(y,x,"ALL"))
print(mmetric(y,x,"MAE"))
m=mmetric(y,x,c("MAE","RMSE","RAE","RSE"))
print(m)
# getting NMAE:
m=mmetric(y,x,"NMAE")
cat("NMAE:",round(m,digits=3),"(denominator=",diff(range(y)),")\n")
m=mmetric(y,x,"NMAE",val=5) # usage of different range
cat("NMAE:",round(m,digits=3),"(denominator=",5,")\n")

cat(names(m)[3],"=",round(m[3],digit=2),"\n",sep="")
print(mmetric(y,x,c("COR","R2","Q2")))
print(mmetric(y,x,c("TOLERANCE","NAREC"),val=0.5)) # if admitted/accepted absolute error is 0.5
print(mmetric(y,x,"THEILSU2",val=94.1)) # val = 1-ahead random walk, c(y,94.1), same as below
print(mmetric(y,x,"THEILSU2",val=c(94.1,y[1:5]))) # val = 1-ahead random walk (previous y values)
print(mmetric(y,x,"MASE",val=c(88.1,89.9,93.2,94.1))) # val = in-samples
val=vector("list",length=4)
val[[2]]=0.5;val[[3]]=94.1;val[[4]]=c(88.1,89.9,93.2,94.1)
print(mmetric(y,x,c("MAE","NAREC","THEILSU2","MASE"),val=val))
# user defined error function example:
# myerror = number of samples with absolute error above 0.1% of y: 
myerror=function(y,x){return (sum(abs(y-x)>(0.001*y)))}
print(mmetric(y,x,metric=myerror))
# example that returns a list since "REC" is included:
print(mmetric(y,x,c("MAE","REC","TOLERANCE"),val=1))

### pure binary classification 
y=factor(c("a","a","a","a","b","b","b","b"))
x=factor(c("a","a","b","a","b","a","b","a"))
print(mmetric(y,x,"CONF")$conf)
print(mmetric(y,x,"ALL"))
print(mmetric(y,x,metric=c("ACC","TPR","ACCLASS")))

### probabilities binary classification 
y=factor(c("a","a","a","a","b","b","b","b"))
px=matrix(nrow=8,ncol=2)
px[,1]=c(1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3)
px[,2]=1-px[,1]
print(px)
print(mmetric(y,px,"CONF")$conf)
print(mmetric(y,px,"CONF",D=0.5,TC=2)$conf)
print(mmetric(y,px,"CONF",D=0.3,TC=2)$conf)
print(mmetric(y,px,metric="ALL",D=0.3,TC=2))
print(mmetric(y,px,metric=c("ACC","AUC","AUCCLASS","BRIER","BRIERCLASS","CE"),D=0.3,TC=2))

### pure multi-class classification 
y=factor(c("a","a","b","b","c","c"))
x=factor(c("a","a","b","c","b","c"))
print(mmetric(y,x,metric="CONF")$conf)
print(mmetric(y,x,metric="CONF",TC=-1)$conf)
print(mmetric(y,x,metric="CONF",TC=1)$conf)
print(mmetric(y,x,metric="ALL"))
print(mmetric(y,x,metric=c("ACC","ACCLASS","KAPPA")))
print(mmetric(y,x,metric=c("ACC","ACCLASS","KAPPA"),TC=1))

### probabilities multi-class 
y=factor(c("a","a","b","b","c","c"))
px=matrix(nrow=6,ncol=3)
px[,1]=c(1.0,0.7,0.5,0.3,0.1,0.7)
px[,2]=c(0.0,0.2,0.4,0.7,0.3,0.2)
px[,3]=1-px[,1]-px[,2]
print(px)
print(mmetric(y,px,metric=c("AUC","AUCCLASS","NAUC"),TC=-1,val=0.1))
print(mmetric(y,px,metric=c("AUC","NAUC"),TC=3,val=0.1))
print(mmetric(y,px,metric=c("ACC","ACCLASS"),TC=-1))
print(mmetric(y,px,metric=c("CONF"),TC=3,D=0.5)$conf)
print(mmetric(y,px,metric=c("ACCLASS"),TC=3,D=0.5))
print(mmetric(y,px,metric=c("CONF"),TC=3,D=0.7)$conf)
print(mmetric(y,px,metric=c("ACCLASS"),TC=3,D=0.7))

### ordinal multi-class (example in Ricardo Sousa PhD thesis 2012)
y=ordered(c(rep("a",4),rep("b",6),rep("d",3)),levels=c("a","b","c","d"))
x=ordered(c(rep("c",(4+6)),rep("d",3)),levels=c("a","b","c","d"))
print(mmetric(y,x,metric="CONF")$conf)
print(mmetric(y,x,metric=c("CE","MAEO","MSEO","KENDALL")))
# note: only y needs to be ordered
x=factor(c(rep("b",4),rep("a",6),rep("d",3)),levels=c("a","b","c","d"))
print(mmetric(y,x,metric="CONF")$conf)
print(mmetric(y,x,metric=c("CE","MAEO","MSEO","KENDALL")))

### ranking (multi-class) 
y=matrix(nrow=1,ncol=12);x=y
# http://www.youtube.com/watch?v=D56dvoVrBBE
y[1,]=1:12
x[1,]=c(2,1,4,3,6,5,8,7,10,9,12,11)
print(mmetric(y,x,metric="KENDALL"))
print(mmetric(y,x,metric="ALL"))

y=matrix(nrow=2,ncol=7);x=y
y[1,]=c(2,6,5,4,3,7,1)
y[2,]=7:1
x[1,]=1:7
x[2,]=1:7
print(mmetric(y,x,metric="ALL"))

### mining, several runs, prob multi-class
## Not run: 
##D data(iris)
##D M=mining(Species~.,iris,model="rpart",Runs=2)
##D R=mmetric(M,metric="CONF",aggregate="no")
##D print(R[[1]]$conf)
##D print(R[[2]]$conf)
##D print(mmetric(M,metric="CONF",aggregate="mean"))
##D print(mmetric(M,metric="CONF",aggregate="sum"))
##D print(mmetric(M,metric=c("ACC","ACCLASS"),aggregate="no"))
##D print(mmetric(M,metric=c("ACC","ACCLASS"),aggregate="mean"))
##D print(mmetric(M,metric="ALL",aggregate="no"))
##D print(mmetric(M,metric="ALL",aggregate="mean"))
## End(Not run)

### mining, several runs, regression
## Not run: 
##D data(sin1reg)
##D S=sample(1:nrow(sin1reg),40)
##D M=mining(y~.,data=sin1reg[S,],model="ksvm",search=2^3,Runs=10)
##D R=mmetric(M,metric="MAE")
##D print(mmetric(M,metric="MAE",aggregate="mean"))
##D miR=meanint(R) # mean and t-student confidence intervals
##D cat("MAE=",round(miR$mean,digits=2),"+-",round(miR$int,digits=2),"\n")
##D print(mmetric(M,metric=c("MAE","RMSE")))
##D print(mmetric(M,metric=c("MAE","RMSE"),aggregate="mean"))
##D R=mmetric(M,metric="REC",aggregate="no")
##D print(R[[1]]$rec)
##D print(mmetric(M,metric=c("TOLERANCE","NAREC"),val=0.2))
##D print(mmetric(M,metric=c("TOLERANCE","NAREC"),val=0.2,aggregate="mean"))
## End(Not run)




