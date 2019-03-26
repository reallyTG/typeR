library(ppls)


### Name: penalized.pls.cv
### Title: Cross-validation for Penalized PLS
### Aliases: penalized.pls.cv
### Keywords: multivariate

### ** Examples

# the penalty term in this example does not make much
# sense
X<-matrix(rnorm(20*100),ncol=20)
y<-rnorm(rnorm(100))
P<-Penalty.matrix(m=20)
pen.pls<-penalized.pls.cv(X,y,lambda=c(0,1,10),P=P,ncomp=10,kernel=FALSE)



