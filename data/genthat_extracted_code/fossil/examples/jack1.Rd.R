library(fossil)


### Name: jack1
### Title: First- and second-order jacknife estimators
### Aliases: jack1 jack2
### Keywords: manip

### ** Examples

## sample vector
a<-c(0,5,1,1,2,0,0,1,0,0,8,45)
jack1(a)

## matrix format
a<-matrix(c(0,5,1,1,2,0,0,1,0,0,8,45),4,3)
jack1(a)
jack2(a)
jack2(a,abund = FALSE)

## presence absence matrix of the above abundance matrix
a<-matrix(c(0,1,1,1,1,0,0,1,0,0,1,1),4,3)
jack1(a)
jack2(a)
jack2(a, abund = FALSE)



