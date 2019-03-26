library(LMest)


### Name: bootstrap_lm_basic_cont
### Title: Parametric bootstrap for the basic LM model for continuous
###   outcomes
### Aliases: bootstrap_lm_basic_cont

### ** Examples

## Not run: 
##D # Example based on multivariate longitudinal continuous data 
##D # load data
##D require(mmm)
##D data(multiLongGaussian)
##D res = long2matrices(multiLongGaussian$ID,X=cbind(multiLongGaussian$X,multiLongGaussian$time),
##D       Y=cbind(multiLongGaussian$resp1, multiLongGaussian$resp2))
##D Y = res$YY
##D n = dim(Y)[1]
##D # fit of the Basic LM model for continuous outcomes
##D k = 3
##D out1 = est_lm_basic_cont(Y,k,mod=1)
##D out2 = bootstrap_lm_basic_cont(out1$piv,out1$Pi,out1$Mu,out1$Si,n,mod=1,B = 1000)
## End(Not run)



