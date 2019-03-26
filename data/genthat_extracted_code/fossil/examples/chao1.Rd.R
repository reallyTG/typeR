library(fossil)


### Name: chao1
### Title: Chao's Species Estimators
### Aliases: chao1 chao2
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



