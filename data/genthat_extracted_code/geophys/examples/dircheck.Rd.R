library(geophys)


### Name: dircheck
### Title: Check direction of polygon
### Aliases: dircheck
### Keywords: misc

### ** Examples


L=list()
L$x=c( 0.2188,-0.6668,-1.0992,-0.5105, 0.5106)
L$y=c( 0.76822, 0.75292,-0.01741,-0.74692,-0.48165)
dircheck(L)

K = rev2RH(L)
###  after reversing, 
dircheck(K)







