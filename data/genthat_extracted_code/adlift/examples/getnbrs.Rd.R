library(adlift)


### Name: getnbrs
### Title: getnbrs
### Aliases: getnbrs
### Keywords: arith

### ** Examples

x1<-runif(20)
#
x1
#
y1<-make.signal2("bumps",x=x1)
#
y1
#
order(x1)
#
# shows where the points lie in relation to each other.
#
neigh<-getnbrs(x1,3,order(x1),4,TRUE)
#
neigh$nbrs
#
# these are the indices of the 4 closest neighbours to point 3.
#



