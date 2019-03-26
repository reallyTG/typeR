library(RMTL)


### Name: print.MTL
### Title: Print the meta information of the model
### Aliases: print.MTL

### ** Examples

#create data
data<-Create_simulated_data(Regularization="L21", type="Regression")
#train a MTL model
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500)) 
#print the information of the model
print(model)



