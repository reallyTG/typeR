library(rmetasim)


### Name: landscape.mig.matrix
### Title: Creates a Migration Matrix for All Life Stages
### Aliases: landscape.mig.matrix

### ** Examples


#Circular stepping stone migration model
landscape.mig.matrix(s=3,h=4,mig.model="stepping.stone.linear",first.rep.s=2)

#Two dimensions with diagonal migration model
landscape.mig.matrix(h=18,h.dim=c(3,6),s=2,mig.model="twoDwDiagonal")

#Using a custom migration matrix
R.custom <- matrix(c(0, 0, 1, 0,
                     1, 0, 1, 0,
                     1, 0, 0, 0,
                     1, 0, 1, 0), ncol=4,nrow=4,byrow=TRUE)
landscape.mig.matrix(s=3,h=4,first.rep.s=2,mig.model="custom",R.custom=R.custom)

#Using a distance function. Notice that the distance function requires
#the argument "lambda" that can be given in the "make.mig.matrix"
#function call.

my.dist <- function(distance,lambda) {exp(-distance*lambda)}
landscape.mig.matrix(h=18,h.dim=c(3,6),s=2,mig.model="distance",distance.fun=my.dist,lambda=1)



