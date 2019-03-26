library(MixedDataImpute)


### Name: hcmm_impute
### Title: Generate multiply imputed datasets
### Aliases: hcmm_impute

### ** Examples

## Not run: 
##D library(MixedDataImpute)
##D library(mice) # For the functions implementing combining rules
##D 
##D data(sipp08)
##D 
##D set.seed(1)
##D n = 1000
##D s = sample(1:nrow(sipp08), n)
##D 
##D Y = sipp08[s,1:2]
##D Y[,1] = log(Y[,1]+1)
##D X = sipp08[s,-c(1:2,9)] # Also removes occ code, which has ~23 levels
##D 
##D # MCAR with probability 0.2, for illustration purposes (not matching the paper)
##D 
##D Y[runif(n)<0.2,1] = NA
##D Y[runif(n)<0.2,2] = NA
##D for(j in 1:ncol(X)) X[runif(n)<0.2,j] = NA
##D 
##D kz = 15
##D ky = 60
##D kx = 90
##D 
##D num.impute = 5
##D num.burnin = 10000
##D num.skip = 1000
##D thin.trace = 10
##D 
##D imp = hcmm_impute(X, Y, kz=kz, kx=kx, ky=ky,
##D                   num.impute=num.impute, num.burnin=num.burnin,
##D                   num.skip=num.skip, thin.trace=thin.trace)
##D 
##D # Example of getting MI estimates for a regression, using the
##D # pooling functions in mice
##D form = total_earnings~age+I(age^2) + sex*I(own_kid!=0)
##D 
##D fits = lapply(imp$imputations, function(dat) lm(form, data=dat))
##D pooled_ests = pool(as.mira(fits))
##D summary(pooled_ests)
##D 
##D # original, complete data estimates for comparison
##D comdat = sipp08[s,]
##D comdat[,1] = log(comdat[,1]+10)
##D summary(lm(form, data=comdat))
##D 
##D # true population values for comparison
##D pop = sipp08
##D pop[,1] = log(pop[,1]+10)
##D summary(lm(form, data=pop))
##D 
## End(Not run)



