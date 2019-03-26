library(CorReg)


### Name: BicZ
### Title: Compute the BIC of a given structure
### Aliases: BicZ

### ** Examples

   ## Not run: 
##D    require(CorReg)
##D data=mixture_generator(n=15,p=5,valid=0)#dataset generation
##D Z=data$Z #binary adjacency matrix that describes correlations within the dataset
##D X=data$X_appr
##D Bic_null_vect=density_estimation(X=X)$BIC_vect
##D #Computes the BIC associated to each covariate (optional, BicZ can do it if not given as an input)
##D #computes the BIC associated to the structure
##D res=BicZ(X = X,Z = Z,Bic_null_vect=Bic_null_vect)
##D     
## End(Not run)



