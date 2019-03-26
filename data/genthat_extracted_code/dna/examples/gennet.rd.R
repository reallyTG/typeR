library(dna)


### Name: gennet
### Title: General Regression network
### Aliases: gennet

### ** Examples

# small example using gennet with a user-defined ridge regression
X1=rbind(
c(2.5,6.7,4.5,2.3,8.4,3.1),
c(1.2,0.7,4.0,9.1,6.6,7.1),
c(4.3,-1.2,7.5,3.8,1.0,9.3),
c(9.5,7.6,5.4,2.3,1.1,0.2))

## Not run: ourRR=function(X,y,lambda=1){
## solve(t(X)%*%X+diag(ncol(X)))%*%t(X)%*%y}
## Not run: gennet(X1,f=ourRR,recenter.data=
## TRUE,rescale.data=TRUE,symmetrize.scores=
## TRUE,rescale.scores=FALSE)

# compare results with RRnet
RRnet(X1)



