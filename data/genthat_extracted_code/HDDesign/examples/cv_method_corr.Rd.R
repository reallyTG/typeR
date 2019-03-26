library(HDDesign)


### Name: cv_method_corr
### Title: Formula-based method to calculate the PCC of a CV-based
###   classifier when features are correlated.
### Aliases: cv_method_corr

### ** Examples

	## Sigma_1 in the paper
	#first block is pcorr x pcorr of compound symmetry
	#other diagonal block is Identity; off diagonal blocks are 0
	pcorr=10  
	p=500
	rho.cs=.8
	#create first block
	rho=diag(c((1-rho.cs)*rep(1,pcorr),rep(1,p-pcorr)))+ matrix(c(rho.cs*
	rep(1,pcorr),rep(0,p-pcorr)),ncol=1) %*% c(rep(1,pcorr),rep(0,p-pcorr))
	chol.rho1.500=chol(rho[1:pcorr,1:pcorr])
	lmax= max(eigen(rho)$values)
	print(lmax)
	set.seed(1)
	cv_method_corr(mu0=0.4,p=500,m=10,n=80,alpha_list=c(0.0000001,0.0001,0.01),
	nrep=10,p1=0.6,ss=TRUE,pcorr=pcorr,chol.rho=chol.rho1.500,sampling.p=0.5)
	#return 0.6689385 0.6806896 0.6513119
	#alpha_list should be a dense grid of pvalue cut-offs; 
	#three values are used here for simplicity of the example 



