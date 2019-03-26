library(MLCIRTwithin)


### Name: est_multi_poly_between
### Title: Estimate latent class item response theory (LC-IRT) models for
###   dichotomous and polytomous responses under between-item
###   multidimensionality
### Aliases: est_multi_poly_between
### Keywords: maximum likelihood estimation Expectation-Maximization
###   algorithm

### ** Examples


## Not run: 
##D # Fit a Graded response model with two dimensions (free discrimination
##D # and difficulty parameters; three latent classes):
##D data(SF12_nomiss)
##D S = SF12_nomiss[,1:12]
##D X = SF12_nomiss[,13]
##D multi0 = rbind(c(1:5, 8), c(6:7,9:12))
##D k=3
##D 
##D out1 =  est_multi_poly_between(S=S,k=k,X=X,link="global",disc=TRUE,
##D                                multi=multi0,fort=TRUE,disp=TRUE,out_se=TRUE) 
##D 
##D # Display output:
##D summary(out1)
##D out1$lk
##D out1$Th
##D out1$piv
##D out1$De
## End(Not run)

## Not run: 
##D ## Fit the model under different external constraints on abilities and/or item parameters
##D # Fixed ability levels; all item parameters can be free  
##D S1 = pmin(as.matrix(S),2) # all items have the same number of categories
##D Zth = matrix(0,nrow(multi0)*k,0)
##D zth = c(rep(-1, times=nrow(multi0)), rep(0, times=nrow(multi0)),  rep(1, times=nrow(multi0)))
##D Zbe = diag(ncol(S1)*2)  # free item difficulties: 12*2  = 24 (12 items with 3 categories)
##D Zga = diag(ncol(S1));  # free item discriminating parameters = 12 items loading on U
##D outc1 = est_multi_poly_between(S=S1,k=k,X=X,link="global",disc=TRUE, multi=multi0,disp=TRUE,
##D                                out_se=TRUE,Zth=Zth,zth=zth,Zbe=Zbe,Zga=Zga) 
##D outc1$Th
##D outc1$tht
##D outc1$Bec                                                          
##D 
##D # Add equality constraints on item parameters                         
##D # Same difficulties for pairs of items 1-7, 2-8, 3-9, 4-10, 5-11, 6-12; 
##D # same discriminating indices for items 2 and 3;
##D # free ability levels
##D Zbe = (matrix(1,2,1)%x%diag(12))[,-1]
##D Zga = as.matrix(rep(0, times=12)); Zga[2,1] = 1; Zga[3,1] = 1; 
##D Zga1p1 = matrix(0, nrow=3, ncol=9); Zga1p2 = diag(9); Zga1p = rbind(Zga1p1, Zga1p2)
##D Zga = cbind(Zga, Zga1p)
##D # discriminating index of item 1 constrained to 1 for the model identifiability
##D zga = rep(0,nrow(Zga)); zga[1] = 1 
##D outc2 = est_multi_poly_between(S=S1,k=k,X=X,link="global",disc=TRUE, 
##D                              multi = multi0,disp=TRUE,tol=10^-4,
##D                              out_se=TRUE,Zbe=Zbe, Zga=Zga, zga=zga)
##D outc2$tht
##D outc2$Th
##D outc2$Ths
##D outc2$Bec
##D outc2$Becs
##D outc2$gac 
##D outc2$gacs
## End(Not run)




