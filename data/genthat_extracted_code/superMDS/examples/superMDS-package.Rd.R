library(superMDS)


### Name: superMDS-package
### Title: Supervised multidimensional scaling for visualization,
###   classification, and bipartite ranking
### Aliases: superMDS-package superMDS

### ** Examples

########### Generate some data  ############
n <- 30
p <- 10
x <- matrix(rnorm(n*p),ncol=p)
y <- c(rep(1,n/2),rep(2,n/2))
xte <- matrix(rnorm(n*p),ncol=p)
yte <- c(rep(1,n/2),rep(2,n/2))
x[y==1,1:(p)] <-  x[y==1,1:(p)] + .4
x[y==2,1:(p)] <-  x[y==2,1:(p)] - .4
xte[yte==1,1:(p)] <-  xte[yte==1,1:(p)] + .4
xte[yte==2,1:(p)] <-  xte[yte==2,1:(p)] - .4    
# Done generating data  #

########### Perform SuperMDS ##############
out <- TrainSuperMDS(x=x,y=y,alpha=.4,S=2, silent=TRUE)
# A plot of the training configuration points #
par(mfrow=c(1,2))
plot(out$z, col=yte, main="Training Data", xlab="Dimension 1", ylab="Dimension 2")
testout <- TestSuperMDS(trout=out,xte=xte)
ytehat <- testout$ytehat
# A table showing the true vs predicted class labels #
print(table(ytehat,yte)) 
# A plot of the test configuration points #
plot(testout$zte, col=yte, main="Test Data", xlab="Dimension 1", ylab="Dimension 2")



