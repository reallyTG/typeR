library(dtw)


### Name: mvm
### Title: Minimum Variance Matching algorithm
### Aliases: mvm mvmStepPattern
### Keywords: ts

### ** Examples


## The hand-checkable example given in Fig. 5, ref. [1] above
diffmx <- matrix( byrow=TRUE, nrow=5, c(
  0,  1,  8,  2,  2,  4,  8,
  1,  0,  7,  1,  1,  3,  7,
 -7, -6,  1, -5, -5, -3,  1,
 -5, -4,  3, -3, -3, -1,  3,
 -7, -6,  1, -5, -5, -3,  1 ) ) ;

## Cost matrix
costmx <- diffmx^2;

## Compute the alignment
al <- dtw(costmx,step.pattern=mvmStepPattern(10))

## Elements 4,5 are skipped
print(al$index2)

plot(al,main="Minimum Variance Matching alignment")






