library(MLCIRTwithin)


### Name: MLCIRTwithin-package
### Title: Latent Class Item Response Theory (LC-IRT) Models under
###   Within-Item Multidimensionality
### Aliases: MLCIRTwithin-package MLCIRTwithin
### Keywords: package

### ** Examples

## Not run: 
##D # Estimation of a two-tier LC-IRT model 
##D data(SF12_nomiss)
##D S = SF12_nomiss[,1:12]
##D X = SF12_nomiss[,13]
##D # Define matrices to allocate each item on the latent variables  
##D multi1=rbind(1:6, 7:12)
##D multi2=rbind(4:8, c(2:3, 10:12))
##D # Graded response model with two primary latent variables, each of them
##D # having two dimensions (free discrimination and difficulty parameters;
##D # two latent classes for both the latent variables; one covariate):
##D tol = 10^-6 # decrease the tolerance to obtain more reliable results
##D out1 = est_multi_poly_within(S=S,k1=2,k2=2,X=X,link="global",disc=TRUE,
##D                              multi1=multi1,multi2=multi2,tol=tol,
##D                              disp=TRUE,out_se=FALSE) 
##D # Display output
##D summary(out1)
## End(Not run)



