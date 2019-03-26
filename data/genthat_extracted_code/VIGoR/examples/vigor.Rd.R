library(VIGoR)


### Name: vigor
### Title: Variational Bayesian inference for genome-wide regression
### Aliases: vigor

### ** Examples

#data
data(sampledata)
dim(Geno)#100 samples and 1000 markers
dim(Pheno)#100 samples and 3 traits
dim(Covariates)#100 samples and 2 covariates (including the intercept)

#Use BL. Draw a simple Manhattan plot.
Result<-vigor(Pheno$Height,Geno,"BL",c(1,1),Covariates=Covariates)
plot(abs(Result$Beta),pch=20)
which((abs(Result$Beta)-1.96*Result$Sd.beta)>0) #Significant markers (P<0.05)

#Use BayesC without covariates.
Result<-vigor(Pheno$Height,Geno,"BayesC",matrix(c(4,1,0.01,4,1,0.001),nr=2,byrow=TRUE))
plot(abs(Result$Beta),pch=20)
which((abs(Result$Beta)-1.96*Result$Sd.beta)>0)
print(Result$Alpha)#intercept is automatically added.

#Tuning hyperparameters. Two hyperparameter sets are given as a matrix. Use BayesB.
H<-matrix(c(5,1,0.001,5,1,0.01),nc=3,byrow=TRUE)
print(H)
Result<-vigor(Pheno$Height,Geno,"BayesB",H,Function="tuning",Covariates=Covariates)
plot(abs(Result$Beta),pch=20)
print(Result$MSE)#the set with the lowest MSE was used
#When Function of vigor is "fitting", only the first set is used for regression.
#to repeat analyses under the different sets, for example, 
Result<-as.list(numeric(2))
for(set in 1:2){Result[[set]]<-vigor(Pheno$Height,Geno,"wBSR",H[set,],Covariates=Covariates)}

#Perform cross-validation. Use BL. Number of hyperparameter sets is 2.
#the first set is c(1,0.01) and the second is c(1,0.1)
#6-fold CV
Result<-vigor(Pheno$Height,Geno,"BL",
matrix(c(1,0.01,1,0.1),ncol=2,byrow=TRUE),Function="cv",Nfold=6,Covariates=Covariates)
plot(Result$Prediction$Y,Result$Prediction$Yhat) #plot true and predicted values
cor(Result$Prediction$Y,Result$Prediction$Yhat) #accuracy
print(Result$MSE) #see which the set used at each fold.
print(Result$Partition) #see the partition of CV
#Perform CV using the same partition. Use BayesC.
H<-matrix(c(5,1,0.01,5,1,0.1),nc=3,byrow=TRUE)
Result2<-vigor(Pheno$Height,Geno,"BayesC",H,Function="cv",Nfold=-9,
Partition=Result$Partition,Covariates=Covariates) 
cor(Result2$Prediction$Y,Result2$Prediction$Yhat) #accuracy



