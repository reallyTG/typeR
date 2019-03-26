library(HDDesign)


### Name: cv_method_MC_corr
### Title: MC simulation-based method to calculate the PCC of a CV-based
###   classifier when features are correlated; uses training and testing
###   datasets.
### Aliases: cv_method_MC_corr

### ** Examples

	## Sigma_1 in the paper
	#first block is pcorr x pcorr of compound symmetry
	#other diagonal block is Identity; off diagonal blocks are 0
	
	pcorr=10  
	p=500
	rho.cs=.8
	
	#create first block
	rho=matrix(rep(0,p^2),nrow=p)
	rho[1:pcorr,1:pcorr]=rho.cs
	diag(rho)=rep(1,p)
	
	chol.rho1.500=chol(rho[1:pcorr,1:pcorr])
	
	set.seed(1)
	cv_method_MC_corr(mu0=0.4,p=500,m=10,n=80,alpha_list=c(0.0000001,0.0001,0.01),
	nrep=10,p1=0.6,ss=TRUE,ntest=100,pcorr=10,chol.rho=chol.rho1.500)
	#return: 0.623 0.670 0.576
	#alpha_list should be a dense list of p-value cutoffs; 
	#here we only use a few values to ease computation of the example.



