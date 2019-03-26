library(HDDesign)


### Name: cv_method_MC
### Title: MC simulation-based method to calculate the PCC of a CV-based
###   classifier; calculated using training and test datasets in MC
###   simulations.
### Aliases: cv_method_MC

### ** Examples

	set.seed(1)
	cv_method_MC(mu0=0.4,p=500,m=10,n=80,alpha_list=c(0.0000001,0.0001,0.01),
	nrep=10,p1=0.6,ss=TRUE,ntest=100)
#return: 0.818 0.882 0.754
#alpha_list should be a dense list of p-value cutoffs; 
#here we only use a few values to ease computation of the example.



