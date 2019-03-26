library(adlift)


### Name: Amatdual
### Title: Amatdual
### Aliases: Amatdual Amatdual2
### Keywords: array

### ** Examples

#
x<-runif(256)
y<-make.signal2("doppler",x=x)
a<-fwtnp(x,y,LocalPred=AdaptNeigh,neighbours=2)
#
Adual<-Amatdual(90,a$pointsin,a$removelist,a$neighbrs[[90]],
a$gamlist[[90]],a$alphalist[[90]])
#
Adual
#
#the 90th refinement matrix for the transform above.
#



