library(miceadds)


### Name: write.mice.imputation
### Title: Export Multiply Imputed Datasets from a 'mids' Object
### Aliases: write.mice.imputation
### Keywords: mice utility function mids

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation of nhanes data and write imputed datasets on disk
##D #############################################################################
##D 
##D data(nhanes,package="mice")
##D 
##D #**********
##D # Model 1: Imputation using mice
##D imp1 <- mice::mice( nhanes, m=3, maxit=5 )
##D # write results
##D write.mice.imputation(mi.res=imp1, name="mice_imp1" )
##D 
##D #**********
##D # Model 2: Imputation using mice.1chain
##D imp2 <- miceadds::mice.1chain( nhanes, burnin=10, iter=20, Nimp=4 )
##D # write results
##D write.mice.imputation(mi.res=imp2, name="mice_imp2" )
## End(Not run)



