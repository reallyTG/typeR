library(PCAmixdata)


### Name: predict.PCAmix
### Title: Prediction of new scores in PCAmix or PCArot
### Aliases: predict.PCAmix

### ** Examples

# quantitative data
data(decathlon)
n <- nrow(decathlon)
sub <- sample(1:n,20)
pca<-PCAmix(decathlon[sub,1:10], graph=FALSE)
predict(pca,decathlon[-sub,1:10])
rot <- PCArot(pca,dim=4)
predict(rot,decathlon[-sub,1:10])

# quantitative and qualitative data
data(wine)
str(wine)
X.quanti <- splitmix(wine)$X.quanti
X.quali <- splitmix(wine)$X.quali
pca<-PCAmix(X.quanti[,1:27],X.quali,ndim=4,graph=FALSE)
n <- nrow(wine)
sub <- sample(1:n,10)
pca<-PCAmix(X.quanti[sub,1:27],X.quali[sub,],ndim=4)
pred <- predict(pca,X.quanti[-sub,1:27],X.quali[-sub,])
plot(pca,axes=c(1,2))
points(pred[,c(1,2)],col=2,pch=16)
text(pred[,c(1,2)], labels = rownames(X.quanti[-sub,1:27]), col=2,pos=3)



