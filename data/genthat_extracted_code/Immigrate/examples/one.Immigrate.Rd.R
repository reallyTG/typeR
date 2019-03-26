library(Immigrate)


### Name: one.Immigrate
### Title: one.Immigrate
### Aliases: one.Immigrate
### Keywords: Immigrateone

### ** Examples

data(park)
xx<-park$xx
yy<-park$yy
W0 <- diag(rep(1,ncol(xx)),ncol(xx))/sqrt(ncol(xx))
re<-one.Immigrate(xx,yy,W0)
print(re$w)



