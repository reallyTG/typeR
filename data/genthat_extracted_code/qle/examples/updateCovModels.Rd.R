library(qle)


### Name: updateCovModels
### Title: Update covariance models
### Aliases: updateCovModels

### ** Examples


data(normal)

# old design
X <- as.matrix(qsd$qldata[c(1,2)])

# augment design with two additional points
Xnew <- multiDimLHS(N=2,qsd$lower,qsd$upper,X=X,
           method="augmentLHS",type="matrix")

# new simulations
Xsim <- simQLdata(sim=qsd$simfn,nsim=10,X=Xnew)

# prepare data
Xdata <- setQLdata(Xsim,Xnew)

# do not re-estimate covariance parameters
qsd2 <- updateCovModels(qsd,Xdata,fit=FALSE) 
 



