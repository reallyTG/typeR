library(HDDesign)


### Name: hct_method_corr
### Title: Estimate PCC of HCT Classifiers via implementation of Monte
###   Carlo simulations with correlated features.
### Aliases: hct_method_corr

### ** Examples

## Sigma_1 in the paper
#first block is pcorr x pcorr of compound symmetry
#other diagonal block is Identity; off diagonal blocks are 0
	pcorr=10  
	p=500
	rho.cs=.8
	#create first block
	rho= diag(c((1-rho.cs)*rep(1,pcorr),rep(1,p-pcorr)))+ matrix(c(rho.cs*
	rep(1,pcorr),rep(0,p-pcorr)), ncol=1) %*% c(rep(1,pcorr),rep(0,p-pcorr))
	chol.rho1.500=chol(rho[1:pcorr,1:pcorr])
	set.seed(1)
	hct_method_corr(mu0=0.4,p=500,m=10,n=80,hct=hct_beta,alpha0=0.5,nrep=10,
	p1=0.5,ss=TRUE,pcorr=pcorr,chol.rho=chol.rho1.500)
	#return: 0.6672256 0.6672256 0.6672256



