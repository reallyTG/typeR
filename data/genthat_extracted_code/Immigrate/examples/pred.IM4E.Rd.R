library(Immigrate)


### Name: pred.IM4E
### Title: pred.IM4E
### Aliases: pred.IM4E
### Keywords: IM4E pred

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
index<-c(1:floor(nrow(xx)*0.3))
train_xx<-xx[-index,]
test_xx<-xx[index,]
train_yy<-yy[-index]
test_yy<-yy[index]
re<-IM4E(train_xx,train_yy)
pred.res<-pred.IM4E(re,train_xx,train_yy,test_xx,type="class")
print(pred.res)




