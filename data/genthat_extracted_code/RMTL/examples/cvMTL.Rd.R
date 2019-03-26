library(RMTL)


### Name: cvMTL
### Title: K-fold cross-validation
### Aliases: cvMTL

### ** Examples

#create the example data
data<-Create_simulated_data(Regularization="L21", type="Classification")
#perform the cross validation
cvfit<-cvMTL(data$X, data$Y, type="Classification", Regularization="L21", 
    Lam2=0, opts=list(init=0,  tol=10^-6, maxIter=1500), nfolds=5,
    stratify=TRUE, Lam1_seq=10^seq(1,-4, -1))
#show meta-infomration
str(cvfit)
#plot the CV accuracies across lam1 sequence
plot(cvfit)



