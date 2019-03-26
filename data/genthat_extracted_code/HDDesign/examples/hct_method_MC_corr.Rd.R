library(HDDesign)


### Name: hct_method_MC_corr
### Title: Estimate PCC of HCT Classifiers constructed with correlated
###   features using Monte Carlo simulations
### Aliases: hct_method_MC_corr

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
hct_method_MC_corr(mu0=0.4, p=500, m=10, n=80, hct=hct_beta, alpha0=0.5, nrep=10, 
p1 = 0.5, ss=TRUE, ntest=100, pcorr=10, chol.rho=chol.rho1.500,sampling.p=0.5)
#return: 0.673 0.686 0.660



