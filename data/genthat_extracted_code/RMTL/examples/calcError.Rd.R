library(RMTL)


### Name: calcError
### Title: Calculate the prediction error
### Aliases: calcError

### ** Examples

#create example data
data<-Create_simulated_data(Regularization="L21", type="Regression")
#train a model 
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500)) 
#calculate the training error
calcError(model, newX=data$X, newY=data$Y)
#calculate the test error
calcError(model, newX=data$tX, newY=data$tY)




