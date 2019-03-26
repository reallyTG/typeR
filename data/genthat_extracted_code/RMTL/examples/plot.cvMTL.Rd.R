library(RMTL)


### Name: plot.cvMTL
### Title: Plot the cross-validation curve
### Aliases: plot.cvMTL

### ** Examples

#create the example data
data<-Create_simulated_data(Regularization="L21", type="Classification")
#perform the cv
cvfit<-cvMTL(data$X, data$Y, type="Classification", Regularization="L21", 
    Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500), nfolds=5,
    stratify=TRUE, Lam1_seq=10^seq(1,-4, -1))
#plot the curve
plot(cvfit)



