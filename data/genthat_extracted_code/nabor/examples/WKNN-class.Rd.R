library(nabor)


### Name: WKNNF-class
### Title: Wrapper classes for k-NN searches enabling repeated queries of
###   the same tree
### Aliases: WKNNF-class WKNNF WKNN WKNND-class WKNND

### ** Examples

## Basic usage
# load sample data consisting of list of 3 separate 3d pointets
data(kcpoints)
# build a tree and query it with two different sets of points
w1 <- WKNNF(kcpoints[[1]])
w1q2 <- w1$query(kcpoints[[2]], k=5, eps=0, radius=0)
str(w1q2)
w1q3 <- w1$query(kcpoints[[3]], k=5, eps=0, radius=0)
# note that there will be small difference between WKNNF and knn due to loss 
# of precision in the double to float conversion when a WKNNF tree is 
# built and queried.
stopifnot(all.equal(
 knn(data=kcpoints[[1]], query=kcpoints[[2]], k=5, eps=0, radius=0),
 w1q2, tolerance=1e-6))
 
## storage mode: must be double
m=matrix(1:24, ncol=3)
storage.mode(m)
# this will generate an error unless we change to a double
w=tools::assertCondition(WKNND(m), "error")
storage.mode(m)="double"
w=WKNND(matrix(m, ncol=3))

## construct wrapper objects but delay tree construction
w1 <- WKNNF(kcpoints[[1]], FALSE)
# query triggers tree construction
w1q2 <- w1$query(kcpoints[[2]], k=5, eps=0, radius=0)
str(w1q2)

## queries using wrapper objects
wkcpoints <-lapply(kcpoints, WKNNF, FALSE)
# query all 3 point sets against first
# this will trigger tree construction only for pointset 1
qall <- lapply(wkcpoints, 
  function(x) wkcpoints[[1]]$queryWKNN(x$.CppObject, k=5, eps=0, radius=0))
str(qall)



