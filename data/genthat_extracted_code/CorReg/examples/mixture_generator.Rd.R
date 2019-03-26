library(CorReg)


### Name: mixture_generator
### Title: Gaussian mixtures dataset generator with regression between the
###   covariates
### Aliases: mixture_generator

### ** Examples

## Not run: 
##D require(CorReg)
##D    #dataset generation
##D    base=mixture_generator(n=1500,p=10,valid=0)
##D    X_appr=base$X_appr #learning sample
##D    Y_appr=base$Y_appr#response variable
##D    for(i in 1:ncol(X_appr)){
##D    hist(X_appr[,i])
##D    }
##D    
## End(Not run)




