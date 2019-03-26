library(MLCIRTwithin)


### Name: search.model_within
### Title: Search for the global maximum of the log-likelihood of
###   within-item muldimensional models
### Aliases: search.model_within
### Keywords: maximum likelihood estimation Expectation-Maximization
###   algorithm

### ** Examples


## Not run: 
##D # Fit the model under different within-item multidimensional structures
##D # for SF12_nomiss data
##D data(SF12_nomiss)
##D S = SF12_nomiss[,1:12]
##D X = SF12_nomiss[,13]
##D 
##D # Partial credit model with two latent variables sharing six items 
##D # (free difficulty parameters and constrained discriminating parameters; 
##D # 1 to 3 latent classes for the 1st latent variable and 1 to 2 classes for the 2nd latent variable; 
##D # one covariate):
##D multi1 = c(1:5, 8:12)
##D multi2 = c(6:12, 1)
##D out1 = search.model_within(S=S,kv1=1:3,kv2=1:2,X=X,link="global",disc=FALSE,
##D                              multi1=multi1,multi2=multi2,disp=TRUE,
##D                              out_se=TRUE,tol1=10^-4, tol2=10^-7, nrep=1)
##D                              
##D # Main output
##D out1$lkv 
##D out1$aicv
##D out1$bicv 
##D # Model with 2 latent classes for each latent variable
##D out1$out.single[[4]]$k1 
##D out1$out.single[[4]]$k2 
##D out1$out.single[[4]]$Th1          
##D out1$out.single[[4]]$Th2 
##D out1$out.single[[4]]$piv1 
##D out1$out.single[[4]]$piv2   
##D out1$out.single[[4]]$ga1c
##D out1$out.single[[4]]$ga2c   
##D out1$out.single[[4]]$Bec            
## End(Not run)




