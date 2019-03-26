library(RMTL)


### Name: plotObj
### Title: Plot the historical values of objective function
### Aliases: plotObj

### ** Examples

#create the example date
data<-Create_simulated_data(Regularization="L21", type="Regression")
#Train a MTL model
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500))
#plot the objective values
plotObj(model)



