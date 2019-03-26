library(LMest)


### Name: LMest-package
### Title: Fit latent Markov models
### Aliases: LMest-package LMest
### Keywords: package

### ** Examples

# Example of drug consumption data
# load data
data(data_drug)
data_drug = as.matrix(data_drug)
S = data_drug[,1:5]-1
yv = data_drug[,6]
n = sum(yv)
# fit of the Basic LM model
k = 3
out1 = est_lm_basic(S,yv,k,mod=1,out_se=TRUE)
## Not run: 
##D out2 = bootstrap_lm_basic(out1$piv,out1$Pi,out1$Psi,n,mod=1,B=1000)
## End(Not run)



