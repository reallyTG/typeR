library(Immigrate)


### Name: one.IM4E
### Title: one.IM4E
### Aliases: one.IM4E
### Keywords: IM4E

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
w0 <- rep(1,ncol(xx))/ncol(xx)
re<-one.IM4E(xx,yy,w0)
print(re$w)



