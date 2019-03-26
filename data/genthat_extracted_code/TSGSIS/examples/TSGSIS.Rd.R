library(TSGSIS)


### Name: TSGSIS
### Title: Two Stage-Grouped Sure Independence Screening
### Aliases: TSGSIS

### ** Examples

#We investigate the performance of TS-GSIS under model 1 with intra-gene correlation rho = 0.2, 
#trait dispersion sigma^2 = 1, effect size k = 3 and homogeneous MAF. 
#Given 100 SNPs with gene size d = 10, 500 unrelated individuals are simulated.
#(Please refer to the Figure 3 of the reference)

library(glmnet)
library(MASS)

set.seed(1)# Set seed
#Parameter setting
ntotal = 500
p = 100
n.pred = 10 #Gene sizes
rho = 0.2 #Intra-gene correlation in block
k = 3 #Effect size
vari = 1 #Sigma2
lambda = 0.5 #For lasso parameter
ntest = 150 #For evaluation
Method="Reg"#For quantitative trait
#Heterogeneous MAF: randomly set to 0.35, 0.2 or 0.1 with equal likelihood.
MAF = matrix(0,2,3) 
MAF[,1] = c(0.1225,0.5775)
MAF[,2] = c(0.04,0.36)
MAF[,3] = c(0.01,0.19)
#Trait Y
modelY = "k*XA[,1] - k*(sqrt(rho))*XA[,5] + k*XA[,31]*XA[,5] + rnorm(ntotal,0,vari)"

PAS1 = function(z){ g = paste("A",z,sep = "") 
	return(g)
}#Define colname fun.
norm = function(a) (a-mean(a))/sd(a) #Define standardization fun.

#The codes of simulated data for quantitative trait are listed in the following. We use mvrnorm
#function to simulate the genotype data. Y is continuous with normal distribution, all errors are
#assumed to be normally distributed with a mean of zero and a variance of one (vari = 1).
out = array(0, dim=c(n.pred)) #For LOOCV
corrmat = diag(rep(1-rho, n.pred)) + matrix(rho, n.pred, n.pred) #Create covariance matrix with rho
corrmat[,5] = sqrt(rho)
corrmat[5,] = sqrt(rho)
corrmat[5,5] = 1
L = array(0, dim=c(n.pred, n.pred, (p/n.pred)))
L[,,1] = corrmat
for(i in 2:(p/n.pred)){ 
	L[,,i] = diag(rep(1-rho, n.pred)) + matrix(rho, n.pred, n.pred)
}
temp = "bdiag(L[,,1]"
for (i in 2:(p/n.pred)){
	temp = paste(temp,",","L[,,",i,"]", sep="")
}
temp = paste(temp,")", sep="")
corrmat2 = eval(parse(text=temp))

beta0 = matrix(0,p,1) #Simulate genotype
X = matrix(0,ntotal,p)
X = mvrnorm(ntotal, beta0, corrmat2 , tol=1e-8, empirical=FALSE)
XA = data.frame(X); colnames(XA) <- c(sapply(1:p,PAS1))
C1 = matrix(0,1,p)
C2 = matrix(0,1,p)
tempMAF = sample(3,1)
for (i in 1:p){
	C2[1,i] = quantile(X[,i], MAF[1,tempMAF])
	C1[1,i] = quantile(X[,i], MAF[2,tempMAF])
	XA[X[,i] > C1[,i],i] = 1
	XA[X[,i] <= C1[,i] & X[,i] >= C2[,i],i] = 0
	XA[X[,i] < C2[,i],i] = -1
}
XA = apply(XA, 2, norm) #Standardization

Y = eval(parse(text=modelY)) #Simulate gaussian response

temp = 1:p
Gene_list = matrix(temp,nrow=n.pred) #Create Gene-based SNP set
#Run TSGSIS fun. with XA, Y, Gene_list, ntest (for predicted model), lambda of lasso regression,
#Method types: "Reg" for quantitative trait; "LR" for disease trait.
Screen_result = TSGSIS(XA, Y, Gene_list, ntest, lambda, Method) 



