library(LMest)


### Name: est_lm_cov_latent_cont
### Title: Estimate LM model for continuous outcomes with covariates in the
###   latent model
### Aliases: est_lm_cov_latent_cont

### ** Examples

## Not run: 
##D # Example based on multivariate longitudinal continuous data 
##D # load data
##D require(mmm)
##D data(multiLongGaussian)
##D TT=4
##D res = long2matrices(multiLongGaussian$ID,X=cbind(multiLongGaussian$X,multiLongGaussian$time),
##D       Y=cbind(multiLongGaussian$resp1, multiLongGaussian$resp2))
##D Y = res$YY
##D X1 =res$XX[,1,]
##D X2 =res$XX[,2:TT,]
##D 
##D # estimate the model
##D est = est_lm_cov_latent_cont(Y,X1,X2,k=3,output=TRUE)
##D summary(est)
##D 
##D # average transition probability matrix
##D PI = round(apply(est$PI[,,,2:TT],c(1,2),mean),4); PI
## End(Not run)



