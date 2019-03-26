library(sampling)


### Name: balancedtwostage
### Title: Balanced two-stage sampling
### Aliases: balancedtwostage
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of the primary units (3 primary units)
PU=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# selection of 2 primary sampling units and 4 second-stage sampling units
s=balancedtwostage(X,1,2,4,PU,comment=TRUE)
# the sample and the inclusion probabilities
s
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$ME84)
N=dim(X)[1]
PU=MU284$CL
m=20
n=60
res=balancedtwostage(X,1,m,n,PU,TRUE)
# the sample and the inclusion probabilities
res



