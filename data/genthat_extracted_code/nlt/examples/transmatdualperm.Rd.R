library(nlt)


### Name: transmatdualperm
### Title: transmatdualperm
### Aliases: transmatdualperm
### Keywords: array

### ** Examples

x1<-runif(10)
y1<-make.signal2("doppler",x=x1)
#
vec<-sample(1:10,8,FALSE)

a<-transmatdualperm(x1,y1,AdaptNeigh,2,TRUE,TRUE,2,perm=vec)
#
a$Wnew
#
#the transform matrix for this adaptive lifting scheme 




