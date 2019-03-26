library(penalizedSVM)


### Name: lpsvm
### Title: Fit L1-norm SVM
### Aliases: lpsvm

### ** Examples

set.seed(123)
train<-sim.data(n = 20, ng = 100, nsg = 10, corr=FALSE, seed=12)
print(str(train)) 
	
# train data	
model <- lpsvm(A=t(train$x), d=train$y, k=5, nu=0,output=0, delta=10^-3, epsi=0.001, seed=12)
print(model)





