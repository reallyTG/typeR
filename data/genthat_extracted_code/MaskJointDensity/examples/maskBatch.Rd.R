library(MaskJointDensity)


### Name: maskBatch
### Title: A batch function that the Data Provider can use to mask the
###   confidential original data to give to the user, all in one batch
### Aliases: maskBatch
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

set.seed(123)
y1 <- rmulti(n=10000, mean=c(30, 50), sd=c(4,2), p=c(0.3, 0.7))
      # y1 is a sample drawn from Y.
noise1 <-rmulti(n=10000, mean=c(80, 100), sd=c(5,3), p=c(0.6, 0.4))
      # noise is a sample drawn from C.
a1<-runif(1, min=min(y1)-2,max=min(y1))
b1<-runif(1, min=max(y1), max=max(y1)+2)

set.seed(123)
y2 <- rmulti(n=10000, mean=c(30, 50), sd=c(4,2), p=c(0.4, 0.6))
      # y2 is a sample drawn from Y.
noise2<-rmulti(n=10000, mean=c(80, 100), sd=c(5,3), p=c(0.5, 0.5))
      # noise2 is a sample drawn from C.
a2<-runif(1, min=min(y2)-2,max=min(y2))
b2<-runif(1, min=max(y2), max=max(y2)+2)


ymaskBatch <- maskBatch(listOfVectorsToBeMasked = list(y1,y2),
listOfNoisefiles=list(file.path(tempdir(),"noise1.bin"),file.path(tempdir(),"noise2.bin")), 
listOfNoises=list(noise1,noise2),
listOfLowerBoundsAsGivenByProvider=list(a1,a2),
listofUpperBoundsAsGivenByProvider=list(b1,b2))

fileNamesToWrite <- list(file.path(tempdir(),"ystar1.dat"), file.path(tempdir(),"ystar2.dat"))
for(i in 1:2) {
write((ymaskBatch[[i]])$ystar, fileNamesToWrite[[i]])
}



