library(fossil)


### Name: bootstrap
### Title: Bootstrap Species Richness Estimator
### Aliases: bootstrap
### Keywords: manip

### ** Examples

## sample vector
a<-c(0,5,1,1,2,0,0,1,0,0,8,45)
bootstrap(a,samples=45)

## matrix format
a<-matrix(c(0,5,1,1,2,0,0,1,0,0,8,45),4,3)
bootstrap(a)
bootstrap(a,,FALSE)


## presence absence matrix
a<-matrix(c(0,1,1,1,1,0,0,1,0,0,1,1),4,3)
bootstrap(a,,FALSE)



