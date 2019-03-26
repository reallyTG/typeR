library(LMest)


### Name: bootstrap_lm_cov_latent_cont
### Title: Parametric bootstrap for LM models for continuous outcomes with
###   individual covariates in the latent model
### Aliases: bootstrap_lm_cov_latent_cont

### ** Examples

## Not run: 
##D # Example based on multivariate longitudinal continuous data 
##D # load data
##D require(mmm)
##D data(multiLongGaussian)
##D TT=4
##D res = long2matrices(multiLongGaussian$ID,X=cbind(multiLongGaussian$X,multiLongGaussian$time),
##D                     Y=cbind(multiLongGaussian$resp1, multiLongGaussian$resp2))
##D Y = res$YY
##D X1 =res$XX[,1,]
##D X2 =res$XX[,2:TT,]
##D 
##D # estimate the model
##D est = est_lm_cov_latent_cont(Y,X1,X2,k=3,output=TRUE)
##D out = bootstrap_lm_cov_latent_cont(X1,X2,Mu=est$Mu,Si=est$Si,Be=est$Be,Ga=est$Ga,B=1000)
##D 
## End(Not run)



