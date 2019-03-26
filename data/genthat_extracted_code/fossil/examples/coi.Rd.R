library(fossil)


### Name: coi
### Title: Cohesiveness Index for Relational Clustering
### Aliases: coi
### Keywords: manip

### ** Examples

## sample vector
a<-c(0,5,1,1,2,0,0,1,0,0,8,45)
chao1(a)

## matrix format
a<-matrix(c(0,5,1,1,2,0,0,1,0,0,8,45),4,3)
chao1(a)
chao2(a)

## presence absence matrix
a<-matrix(c(0,1,1,1,1,0,0,1,0,0,1,1),4,3)
chao1(a)
chao2(a)



