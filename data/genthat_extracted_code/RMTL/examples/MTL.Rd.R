library(RMTL)


### Name: MTL
### Title: Train a multi-task learning model.
### Aliases: MTL

### ** Examples

#create the example data
data<-Create_simulated_data(Regularization="L21", type="Regression")
#train a MTL model
#cold-start
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500))
#warm-start
model<-MTL(data$X, data$Y, type="Regression", Regularization="L21",
    Lam1=0.1, Lam1_seq=10^seq(1,-4, -1), Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500))
#meta-information
str(model)
#plot the historical objective values
plotObj(model)



