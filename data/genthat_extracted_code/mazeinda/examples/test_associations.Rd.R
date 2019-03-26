library(mazeinda)


### Name: test_associations
### Title: test_associations
### Aliases: test_associations

### ** Examples

v1=c(0,0,10,0,0,12,2,1,0,0,0,0,0,1)
v2=c(0,1,1,0,0,0,1,1,64,3,4,2,32,0)
test_associations(v1,v2)
m1=matrix(c(0,0,10,0,0,12,2,1,0,0,0,0,0,1,1,64,3,4,2,32,0,0,43,54,3,0,0,3,20,1),6)
test_associations(m1,m1)
m2=matrix(c(0,1,1,0,0,0,1,1,64,3,4,2,32,0,0,43,54,3,0,0,3,20,10,0,0,12,2,1,0,0),6)
test_associations(m1,m2)
m3= matrix(abs(rnorm(36)),6)
m4= matrix(abs(rnorm(36)),6)
test_associations(m3,m4)



