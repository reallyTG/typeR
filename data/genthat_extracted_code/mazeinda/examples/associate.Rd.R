library(mazeinda)


### Name: associate
### Title: Associate pairwise vectors form one or two sets
### Aliases: associate

### ** Examples

v1=c(0,0,10,0,0,12,2,1,0,0,0,0,0,1)
v2=c(0,1,1,0,0,0,1,1,64,3,4,2,32,0)
associate(v1,v2)
m1=matrix(c(0,0,10,0,0,12,2,1,0,0,0,0,0,1,1,64,3,4,2,32,0,0,43,54,3,0,0,3,20,1),6)
associate(m1,m1)
m2=matrix(c(0,1,1,0,0,0,1,1,64,3,4,2,32,0,0,43,54,3,0,0,3,20,10,0,0,12,2,1,0,0),6)
associate(m1,m2)



