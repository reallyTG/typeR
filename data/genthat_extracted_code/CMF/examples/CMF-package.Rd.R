library(CMF)


### Name: CMF-package
### Title: Collective Matrix Factorization (CMF)
### Aliases: CMF-package
### Keywords: package

### ** Examples

 require("CMF")
 # Create data for a circular setup with three matrices and three
 # object sets of varying sizes.
 X <- list()
 D <- c(10,20,30)
 inds <- matrix(0,nrow=3,ncol=2)
 
 # Matrix 1 is between sets 1 and 2 and has continuous data
 inds[1,] <- c(1,2)
 X[[1]] <- matrix(rnorm(D[inds[1,1]]*D[inds[1,2]],0,1),nrow=D[inds[1,1]])

 # Matrix 2 is between sets 1 and 3 and has binary data
 inds[2,] <- c(1,3)
 X[[2]] <- matrix(round(runif(D[inds[2,1]]*D[inds[2,2]],0,1)),nrow=D[inds[2,1]])

 # Matrix 3 is between sets 2 and 3 and has count data
 inds[3,] <- c(2,3)
 X[[3]] <- matrix(round(runif(D[inds[3,1]]*D[inds[3,2]],0,6)),nrow=D[inds[3,1]])

 # Convert the data into the right format
 triplets <- list()
 for(m in 1:3) triplets[[m]] <- matrix_to_triplets(X[[m]])

 # Missing entries correspond to missing rows in the triple representation
 # so they can be removed from training data by simply taking a subset
 # of the rows.
 train <- list()
 test <- list()
 keepForTraining <- c(100,200,300)
 for(m in 1:3) {
   subset <- sample(nrow(triplets[[m]]))[1:keepForTraining[m]]
   train[[m]] <- triplets[[m]][subset,]
   test[[m]] <- triplets[[m]][setdiff(1:nrow(triplets[[m]]),subset),]
 }

 # Learn the model with the correct likelihoods
 K <- 4
 likelihood <- c("gaussian","bernoulli","poisson")
 opts <- getCMFopts()
 opts$iter.max <- 10 # Less iterations for faster computation
 model <- CMF(train,inds,K,likelihood,D,test=test,opts=opts)

 # Check the predictions
 # Note that the data created here has no low-rank structure,
 # so we should not expect good accuracy.
 print(test[[1]][1:3,])
 print(model$out[[1]][1:3,])

 # predictions for the test set using the previously learned model
 out <- predictCMF(test, model)
 print(out$out[[1]][1:3,])
 print(out$error[[1]])
 # ...this should be the same as the output provided by CMF()
 print(model$out[[1]][1:3,])



