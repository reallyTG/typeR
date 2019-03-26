library(CorReg)


### Name: density_estimation
### Title: BIC of estimated marginal gaussian mixture densities
### Aliases: density_estimation

### ** Examples

## Not run: 
##D   rm(list=ls())#clean the workspace
##D   
##D require(CorReg)
##D    #dataset generation
##D    base=mixture_generator(n=150,p=10,valid=0,ratio=0.4,tp1=1,tp2=1,tp3=1,positive=0.5,
##D                           R2Y=0.8,R2=0.9,scale=TRUE,max_compl=3,lambda=1)
##D    X_appr=base$X_appr #learning sample
##D  density=density_estimation(X = X_appr, detailed = TRUE)#estimation of the marginal densities
##D density$BIC_vect #vector of the BIC (one per variable)
##D density$BIC #global value of the BIC (sum of the BICs)
##D density$nbclust #vector of the numbers of components.
##D density$details #matrices that describe each Gaussian Mixture (proportions, means and variances)
##D 
##D    
## End(Not run)



