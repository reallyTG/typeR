library(adlift)


### Name: matcond
### Title: matcond
### Aliases: matcond
### Keywords: array algebra

### ** Examples

x1<-runif(256)
y1<-make.signal2("doppler",x=x1)
#
m<-matcond(x1,y1,AdaptNeigh,2,TRUE,TRUE,2)
#
m$cno
#
m$v
# shows the two different condition number measures for the matrix associated
# to the transform performed.
#



