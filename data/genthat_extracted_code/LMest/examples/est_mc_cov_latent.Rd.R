library(LMest)


### Name: est_mc_cov_latent
### Title: Estimate Markov chain (MC) model with covariates
### Aliases: est_mc_cov_latent

### ** Examples


## Not run: 
##D 
##D # Example based on criminal data
##D # load criminal data
##D data(data_criminal_sim)
##D 
##D #We consider the response variable referring of crime of type 5
##D 
##D out = long2wide(data_criminal_sim,"id","time","sex",
##D "y5",aggr=T,full=999)	
##D XX = out$XX-1
##D YY = out$YY
##D freq = out$freq
##D TT=6
##D 
##D X1 = as.matrix(XX[,1])
##D X2 = as.matrix(XX[,2:TT])
##D # estimate the model
##D res = est_mc_cov_latent(S=YY,yv=freq,X1=X1,X2=X2,output=TRUE)
##D summary(res)
##D 
##D # Initial probability for female
##D Piv0 = round(colMeans(res$Piv[X1==0,]),4)
##D 
##D # Initial probability for male
##D Piv1 = round(colMeans(res$Piv[X1==1,]),4)
##D 
## End(Not run)



