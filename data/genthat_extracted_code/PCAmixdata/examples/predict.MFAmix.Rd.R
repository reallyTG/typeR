library(PCAmixdata)


### Name: predict.MFAmix
### Title: Prediction of new scores in MFAmix
### Aliases: predict.MFAmix

### ** Examples

data(gironde)
class.var<-c(rep(1,9),rep(2,5),rep(3,9),rep(4,4))
names<-c("employment","housing","services","environment")
dat<-cbind(gironde$employment,gironde$housing,
           gironde$services,gironde$environment)
n <- nrow(dat)
set.seed(10)
sub <- sample(1:n,520)

res<-MFAmix(data=dat[sub,],groups=class.var,
            name.groups=names, rename.level=TRUE, 
            ndim=3,graph=FALSE)

#Predict scores of new data
pred<-predict(res,data=dat[-sub,])
plot(res,choice="ind",cex=0.6,lim.cos2.plot=0.7)  
points(pred[1:5,c(1,2)],col=2,pch=16,cex=0.6)
text(pred[1:5,c(1,2)], labels = rownames(dat[-sub,])[1:5],
     col=2,pos=3,cex=0.6)



