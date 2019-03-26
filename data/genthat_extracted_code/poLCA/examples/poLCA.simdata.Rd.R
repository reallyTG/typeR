library(poLCA)


### Name: poLCA.simdata
### Title: Create simulated cross-classification data
### Aliases: poLCA.simdata
### Keywords: methods

### ** Examples

# Create a sample data set with 3 classes and no covariates,
# and run poLCA to recover the specified parameters.
# Each matrix in the probs list contains one of the manifest variables'
# "true" conditional response probabilities.

probs <- list(matrix(c(0.6,0.1,0.3,     0.6,0.3,0.1,     0.3,0.1,0.6    ),ncol=3,byrow=TRUE), # Y1
              matrix(c(0.2,0.8,         0.7,0.3,         0.3,0.7        ),ncol=2,byrow=TRUE), # Y2
              matrix(c(0.3,0.6,0.1,     0.1,0.3,0.6,     0.3,0.6,0.1    ),ncol=3,byrow=TRUE), # Y3
              matrix(c(0.1,0.1,0.5,0.3, 0.5,0.3,0.1,0.1, 0.3,0.1,0.1,0.5),ncol=4,byrow=TRUE), # Y4
              matrix(c(0.1,0.1,0.8,     0.1,0.8,0.1,     0.8,0.1,0.1    ),ncol=3,byrow=TRUE)) # Y5
simdat <- poLCA.simdata(N=1000,probs,P=c(0.2,0.3,0.5))
f1 <- cbind(Y1,Y2,Y3,Y4,Y5)~1
lc1 <- poLCA(f1,simdat$dat,nclass=3)
table(lc1$predclass,simdat$trueclass)

# Create a sample dataset with 2 classes and three covariates.
# Then compare predicted class memberships when the model is 
# estimated "correctly" with covariates to when it is estimated
# "incorrectly" without covariates.

simdat2 <- poLCA.simdata(N=1000,ndv=7,niv=3,nclass=2,b=matrix(c(1,-2,1,-1)))
f2a <- cbind(Y1,Y2,Y3,Y4,Y5,Y6,Y7)~X1+X2+X3
lc2a <- poLCA(f2a,simdat2$dat,nclass=2)
f2b <- cbind(Y1,Y2,Y3,Y4,Y5,Y6,Y7)~1
lc2b <- poLCA(f2b,simdat2$dat,nclass=2)
table(lc2a$predclass,lc2b$predclass)



