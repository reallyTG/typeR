library(LMest)


### Name: est_lm_cov_manifest
### Title: Estimate LM model with covariates in the measurement model
### Aliases: est_lm_cov_manifest

### ** Examples


## Not run: 
##D # Example based on self-rated health status (SRHS) data
##D 
##D # load SRHS data
##D data(data_SRHS_long)
##D dataSRHS = data_SRHS_long
##D head(dataSRHS)
##D 
##D res = long2matrices(dataSRHS$id,X=cbind(dataSRHS$gender-1,
##D dataSRHS$race==2|dataSRHS$race==3,dataSRHS$education==4,
##D dataSRHS$education==5,dataSRHS$age-50,(dataSRHS$age-50)^2/100),
##D Y=dataSRHS$srhs)
##D 
##D X =res$XX
##D S = 5-res$YY
##D 
##D # *** fit stationary LM model
##D res0 = vector("list",10); tol = 10^-6;
##D for(k in 1:10){
##D   res0[[k]] = est_lm_cov_manifest(S,X,k,1,mod="LM",tol)
##D    save.image("example_SRHS.RData")
##D }
##D 
##D # *** fit the mixture latent auto-regressive model
##D tol = 0.005
##D res = vector("list",4)
##D k=1
##D q = 51
##D res[[k]]=est_lm_cov_manifest(S,X,k,q,mod="FM",tol,output=TRUE)
##D for(k in 2:4) res[[k]]=est_lm_cov_manifest(S,X,k,q=61,mod="FM",tol,output=TRUE)
## End(Not run)



