library(adlift)


### Name: transmatdual
### Title: transmatdual
### Aliases: transmatdual transmatdual2
### Keywords: array

### ** Examples

x1<-runif(10)
y1<-make.signal2("doppler",x=x1)
#
a<-transmatdual(x1,y1,AdaptNeigh,2,TRUE,TRUE,2)
#
a$Wnew
#
#the transform matrix for this adaptive lifting scheme 




