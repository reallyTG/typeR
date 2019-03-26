library(dtw)


### Name: dtwDist
### Title: Compute a dissimilarity matrix
### Aliases: dtwDist
### Keywords: ts

### ** Examples


## Symmetric step pattern => symmetric dissimilarity matrix;
## no problem coercing it to a dist object:

m <- matrix(0,ncol=3,nrow=4)
m <- row(m)
dist(m,method="DTW");

# Old-fashioned call style would be:
#   dtwDist(m)
#   as.dist(dtwDist(m))



## Find the optimal warping _and_ scale factor at the same time.
## (There may be a better, analytic way)

# Prepare a query and a reference

query<-sin(seq(0,4*pi,len=100))
reference<-cos(seq(0,4*pi,len=100))

# Make a set of several references, scaled from 0 to 3 in .1 increments.
# Put them in a matrix, in rows

scaleSet <- seq(0.1,3,by=.1)
referenceSet<-outer(1/scaleSet,reference)

# The query has to be made into a 1-row matrix.
# Perform all of the alignments at once, and normalize the result.

dist(t(query),referenceSet,meth="DTW")->distanceSet

# The optimal scale for the reference is 1.0
plot(scaleSet,scaleSet*distanceSet,
  xlab="Reference scale factor (denominator)",
  ylab="DTW distance",type="o",
  main="Sine vs scaled cosine alignment, 0 to 4 pi")





## Asymmetric step pattern: we can either disregard part of the pairs
## (as.dist), or average with the transpose

mm <- matrix(runif(12),ncol=3)
dm <- dist(mm,mm,method="DTW",step=asymmetric); # a crossdist object

# Old-fashioned call style would be:
#   dm <- dtwDist(mm,step=asymmetric)
#   as.dist(dm)


## Symmetrize by averaging:
(dm+t(dm))/2


## check definition
stopifnot(dm[2,1]==dtw(mm[2,],mm[1,],step=asymmetric)$distance)





