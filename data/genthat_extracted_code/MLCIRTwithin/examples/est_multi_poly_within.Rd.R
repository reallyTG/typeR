library(MLCIRTwithin)


### Name: est_multi_poly_within
### Title: Estimate latent class item response theory (LC-IRT) models for
###   dichotomous and polytomous responses under within-item
###   multidimensionality
### Aliases: est_multi_poly_within
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
##D # Graded response model with two latent variables sharing six items (free
##D # discrimination and difficulty parameters; two latent classes for each
##D # latent variable; one covariate):
##D multi1 = c(1:5, 8:12)
##D multi2 = c(6:12, 1)
##D tol = 10^-6  # decrease tolerance to obtain more reliable results
##D out1 = est_multi_poly_within(S=S,k1=2,k2=2,X=X,link="global",disc=TRUE,
##D                              multi1=multi1,multi2=multi2,disp=TRUE,
##D                              out_se=TRUE,tol=tol) 
##D                              
##D # Partial credit model with two latent variables sharing eleven items
##D # (free discrimination and difficulty parameters; two latent classes for
##D # the 1st latent variable and three latent classes for the 2nd latent
##D # variable; one covariate):
##D multi1 = 1:12
##D multi2 = 2:12
##D out2 = est_multi_poly_within(S=S,k1=2,k2=3,X=X,link="local",disc=TRUE,
##D                              multi1=multi1,multi2=multi2,disp=TRUE,tol=tol)
##D                                
##D # Display output:
##D summary(out2)
##D out2$lk
##D out2$Th1 
##D out2$Th1s
##D out2$piv1
##D out2$Th2
##D out2$Th2s
##D out2$piv2
##D out2$De1
##D out2$De2
## End(Not run)

## Not run: 
##D ## Fit the model under different situations for RLMS data
##D # Example of use of the function to account for non-ignorable missing
##D # item responses 
##D data(RLMS)
##D X = RLMS[,1:4]
##D Y = RLMS[,6:9]
##D YR = cbind(Y,1*(!is.na(Y)))
##D multi1 = 1:4
##D multi2 = 5:8
##D tol = 10^-6  # decrease tolerance to obtain more reliable results
##D 
##D # MAR model
##D out0 = est_multi_poly_within(YR,k1=3,k2=2,X=X,link="global",
##D                  disc=TRUE,multi1=multi1,multi2=multi2,disp=TRUE,
##D                  out_se=TRUE,glob=TRUE,tol=tol) 
##D                  
##D # NMAR model
##D multi1 = 1:8
##D out1 = est_multi_poly_within(YR,k1=3,k2=2,X=X,link="global",
##D                  disc=TRUE,multi1=multi1,multi2=multi2,disp=TRUE,
##D                  out_se=TRUE,glob=TRUE,tol=tol)
##D                    
##D # testing effect of the latent trait on missingness
##D c(out0$bic,out1$bic)
##D (test1 = out1$ga1c[-1]/out1$sega1c[-1])
## End(Not run)

## Not run: 
##D ## Fit the model under different external constraints on abilities and/or item parameters
##D data(SF12_nomiss)
##D S = SF12_nomiss[,1:12]
##D X = SF12_nomiss[,13]
##D multi1m = rbind(1:5, 8:12) # two dimensions for the 1st latent variable 
##D multi2m = rbind(6:9, c(10:12, 1)) # two dimensions for the 2nd latent variable 
##D k1 = 2
##D k2 = 2
##D 
##D # Fixed ability levels; all item parameters can be free
##D Zth1 = matrix(0,nrow(multi1m)*k1,0)
##D zth1 = c(rep(-1, times=nrow(multi1m)),  rep(1, times=nrow(multi1m)))
##D Zth2 = matrix(0,nrow(multi2m)*k2,0)
##D zth2 = c(rep(-1, times=nrow(multi2m)),  rep(1, times=nrow(multi2m)))  
##D # item difficulties: 10*4 + 2*2 = 44 (10 items with 5 categories plus 2 items with 3 categories)
##D Zbe = diag(44)
##D # item discriminating parameters = 10 items loading on the 1st latent variable plus 8 items loading
##D # on the 2nd latent variable
##D Zga1 = diag(10); Zga2 = diag(8) 
##D zga1 = rep(0,nrow(Zga1)); zga1[1] = 1
##D zga2 = rep(0,nrow(Zga2)); zga2[1] = 1
##D out1c = est_multi_poly_within(S=S,k1=k1,k2=k2,X=X,link="global",disc=TRUE,multi1=multi1m,
##D                               multi2=multi2m,disp=TRUE,out_se=TRUE,Zth1=Zth1,zth1=zth1,Zth2=Zth2,
##D                               zth2=zth2,Zbe=Zbe,Zga1=Zga1,zga1=zga1,Zga2=Zga2,zga2=zga2)   
##D summary(out1c)
##D out1c$Bec                             
##D 
##D # Constraint difficulties of the first threshold to be equal for all items 
##D # and difficulties of the second threshold to be equal for all items; 
##D # free ability levels
##D multi1u = c(1:3, 6:10) # one dimension for the 1st latent variable 
##D multi2u = c(4:10, 1)  # one dimension for the 2nd latent variable
##D S1 = pmin(as.matrix(S[, -c(2,3)]),2)  # all items have the same number of categories
##D Zbe = as.matrix((matrix(1,10,1)%x%diag(2))[,-1])  
##D out2c = est_multi_poly_within(S=S1,k1=2,k2=2,X=X,link="global",disc=TRUE,
##D                              multi1=multi1u,multi2=multi2u,disp=TRUE,
##D                              out_se=TRUE,Zbe=Zbe)
##D out2c$Bec   
##D 
##D # Same difficulties for pairs of items 1-6, 2-7, 3-8, 4-9, 5-10; 
##D # free ability levels
##D Zbe = (matrix(1,2,1)%x%diag(10))[,-1]
##D out3c = est_multi_poly_within(S=S1,k1=2,k2=2,X=X,link="global",disc=TRUE,
##D                              multi1=multi1u,multi2=multi2u,disp=TRUE,
##D                              out_se=TRUE,Zbe=Zbe)
##D out3c$Bec  
##D 
##D # Add equality constraints on some discriminating indices for the 1st latent variable
##D Zbe = (matrix(1,2,1)%x%diag(10))[,-1]
##D Zga1 = diag(length(multi1u)); 
##D # discriminating index of item 1 constrained to 1 for the model identifiability
##D # discriminating index of item 3 equal to discriminating index of item 2
##D Zga1 = Zga1[, -c(1, 3)];
##D Zga1[3, 1] = 1 
##D zga1 = rep(0,nrow(Zga1)); zga1[1] = 1
##D out4c = est_multi_poly_within(S=S1,k1=2,k2=2,X=X,link="global",disc=TRUE,
##D                              multi1=multi1u,multi2=multi2u,disp=TRUE,tol=10^-4,
##D                              out_se=TRUE,Zbe=Zbe, Zga1=Zga1, zga1=zga1)   
##D out4c$Bec 
##D out4c$ga1c
##D out4c$ga1t                                                           
## End(Not run)



