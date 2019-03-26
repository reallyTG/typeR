library(predmixcor)


### Name: train_predict_mix
### Title: Classification rule based on Bayesian mixture models with
###   feature selection bias corrected
### Aliases: train_predict_mix begin.predmixcor
### Keywords: classif

### ** Examples


#simulating data set from a Bayesian mixture model
data <- gendata.mix(20,20,50,50,101,10,c(0.9,0.1))

#training the model using Gibbs sampling, without correcting for the feature
#selection bias, then testing on predicting the responses of the test cases, 

predict.uncor <- train_predict_mix(
            test=data$test,train=data$train,k=5,    
            theta0=0,alpha.shape=0.5,alpha.rate=5,no.alpha=5,
	    common.alpha=FALSE,no.alpha0=100,
            mc.iters=30,iters.labeltheta=1,
	    iters.theta=10,width.theta=0.1,
            correction=FALSE,no.theta.adj=5,approxim=TRUE,
            pred.start=10)

#As above, but with the feature selection bias corrected
predict.cor <-   train_predict_mix(
            test=data$test,train=data$train,k=5,    
            theta0=0,alpha.shape=0.5,alpha.rate=5,no.alpha=5,
	    common.alpha=FALSE,no.alpha0=100,
            mc.iters=30,iters.labeltheta=1,
	    iters.theta=10,width.theta=0.1,
            correction=TRUE,no.theta.adj=5,approxim=TRUE,
            pred.start=10)




