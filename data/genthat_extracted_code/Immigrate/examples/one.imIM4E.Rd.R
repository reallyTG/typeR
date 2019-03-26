library(Immigrate)


### Name: one.imIM4E
### Title: one.imIM4E
### Aliases: one.imIM4E
### Keywords: imIM4E

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
w0 <- rep(1,ncol(xx))/ncol(xx)
re<-one.imIM4E(xx,yy,w0)
print(re$w)



