library(TSA)


### Name: tar.skeleton
### Title: Find the asympotitc behavior of the skeleton of a TAR model
### Aliases: tar.skeleton
### Keywords: methods

### ** Examples

data(prey.eq)
prey.tar.1=tar(y=log(prey.eq),p1=4,p2=4,d=3,a=.1,b=.9,print=TRUE)
tar.skeleton(prey.tar.1)



