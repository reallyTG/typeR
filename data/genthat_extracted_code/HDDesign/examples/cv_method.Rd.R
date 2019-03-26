library(HDDesign)


### Name: cv_method
### Title: Formula-based PCC of a CV-based classifier
### Aliases: cv_method

### ** Examples

	set.seed(1)
	cv_method(mu0=0.4, p=500, m=10, n=80, alpha_list=c(0.0000001, 0.0001, 0.01), 
	nrep=10, p1=0.6, ss=TRUE)
	#return: 0.8012142 0.8210082 0.7714031
	#alpha_list should be a dense list of p-value cutoffs; 
	#here we only use a few values to ease computation of the example.



