library(Immigrate)


### Name: pred.Immigrate
### Title: pred.Immigrate
### Aliases: pred.Immigrate
### Keywords: Immigrate pred

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
index<-c(1:floor(nrow(xx)*0.3))
train_xx<-xx[-index,]
test_xx<-xx[index,]
train_yy<-yy[-index]
test_yy<-yy[index]
re<-Immigrate(train_xx,train_yy)
pred.res<-pred.Immigrate(re,train_xx,train_yy,test_xx,type="class")
print(pred.res)




