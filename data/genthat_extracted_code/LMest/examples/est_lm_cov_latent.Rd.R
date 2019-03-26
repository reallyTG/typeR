library(LMest)


### Name: est_lm_cov_latent
### Title: Estimate LM model with covariates in the latent model
### Aliases: est_lm_cov_latent

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
##D n = dim(S)[1]
##D # matrix of covariates (for the first and the following occasions)
##D # colums are: gender,race,educational level (2 columns),age,age^2)
##D X1 =res$XX[,1,]
##D X2 =res$XX[,2:TT,]
##D 
##D # estimate the model
##D est2f = est_lm_cov_latent(S,X1,X2,k=2,output=TRUE,out_se=TRUE)
##D summary(est2f)
##D 
##D # average transition probability matrix
##D PI = round(apply(est2f$PI[,,,2:TT],c(1,2),mean),4)
##D 
##D # Transition probability matrix for white females with high educational level
##D ind1 = (X1[,1]==1 & X1[,2]==0 & X1[,4]==1)
##D PI1 = round(apply(est2f$PI[,,ind1,2:TT],c(1,2),mean),4)
##D 
##D # Transition probability matrix for non-white male, low educational level
##D ind2 = (X1[,1]==0 & X1[,2]==1& X1[,3]==0 & X1[,4]==0)
##D PI2 = round(apply(est2f$PI[,,ind2,2:TT],c(1,2),mean),4)
## End(Not run)



