library(evclass)


### Name: decision
### Title: Decision rules for evidential classifiers
### Aliases: decision

### ** Examples

## Example with M=2 classes
m<-matrix(c(0.9,0.1,0,0.4,0.6,0,0.1,0.1,0.8),3,3,byrow=TRUE)
## Loss matrix with na=4 acts: assignment to class 1, assignment to class2,
# rejection, and assignment to the unknown class.
L<-matrix(c(0,1,1,1,0,1,0.2,0.2,0.2,0.25,0.25,0),3,4)
d<-decision(m,L,'upper') ## instances 2 and 3 are rejected
d<-decision(m,L,'lower') ## instance 2 is rejected, instance 3 is
# assigned to the unknown class




