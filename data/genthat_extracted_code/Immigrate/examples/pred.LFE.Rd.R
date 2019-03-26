library(Immigrate)


### Name: pred.LFE
### Title: pred.LFE
### Aliases: pred.LFE
### Keywords: LFE

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
w<-LFE(xx,yy)
pred<-pred.LFE(w,xx,yy,xx)
print(pred)



