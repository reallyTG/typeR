library(LMest)


### Name: bootstrap_lm_basic
### Title: Parametric bootstrap for the basic LM model
### Aliases: bootstrap_lm_basic

### ** Examples

## Not run: 
##D # Example of drug consumption data
##D # load data
##D data(data_drug)
##D data_drug = as.matrix(data_drug)
##D S = data_drug[,1:5]-1
##D yv = data_drug[,6]
##D n = sum(yv)
##D # fit of the Basic LM model
##D k = 3
##D out1 = est_lm_basic(S,yv,k,mod=1,out_se=TRUE)
##D out2 = bootstrap_lm_basic(out1$piv,out1$Pi,out1$Psi,n,mod=1,B=1000)
## End(Not run)



