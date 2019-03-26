library(LMest)


### Name: bootstrap_lm_cov_latent
### Title: Parametric bootstrap for LM models with individual covariates in
###   the latent model
### Aliases: bootstrap_lm_cov_latent

### ** Examples

## Not run: 
##D # Example based on self-rated health status (SRHS) data
##D # load SRHS data
##D data(data_SRHS_long)
##D dataSRHS = data_SRHS_long
##D 
##D TT = 8 
##D head(dataSRHS)
##D res = long2matrices(dataSRHS$id,X=cbind(dataSRHS$gender-1,
##D dataSRHS$race==2|dataSRHS$race==3, dataSRHS$education==4,
##D dataSRHS$education==5,dataSRHS$age-50,(dataSRHS$age-50)^2/100),
##D Y=dataSRHS$srhs)
##D 
##D # matrix of responses (with ordered categories from 0 to 4)
##D S = 5-res$YY
##D 
##D # matrix of covariates (for the first and the following occasions)
##D # colums are: gender,race,educational level (2 columns),age,age^2)
##D X1 =res$XX[,1,]
##D X2 =res$XX[,2:TT,]
##D 
##D # estimate the model
##D out1 = est_lm_cov_latent(S,X1,X2,k=2,output=TRUE,out_se=TRUE)
##D 
##D out2 = bootstrap_lm_cov_latent(X1,X2,Psi=out1$Psi,Be=out1$Be,Ga=out1$Ga,B=1000)
## End(Not run)



