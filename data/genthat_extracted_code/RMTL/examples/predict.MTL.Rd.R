library(RMTL)


### Name: predict.MTL
### Title: Predict the outcomes of new individuals
### Aliases: predict.MTL

### ** Examples

#Create data
data<-Create_simulated_data(Regularization="L21", type="Regression")
#Train
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500)) 
predict(model, newX=data$tX)




