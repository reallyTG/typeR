library(MEPDF)


### Name: epdf
### Title: epdf
### Aliases: epdf

### ** Examples

library("pracma")
library("plyr")

a<-list(c(-1,-1),c(1,1),c(0.01,0.01))
b<-list(c(-2,-2),c(2,2),c(0.02,0.02))
cubes<-list(a,b)

min.corner = c(-4,-4)
max.corner= c(4,4)
main.gridsize = c(0.05,0.05)

# Data & Density
data<-cbind(rnorm(1000),rnorm(1000))

pdf<-epdf(data,max.corner,min.corner,main.gridsize,rescubes = cubes)




