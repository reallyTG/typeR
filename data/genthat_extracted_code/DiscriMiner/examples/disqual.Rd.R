library(DiscriMiner)


### Name: disqual
### Title: Discriminant Analysis on Qualitative Variables
### Aliases: disqual

### ** Examples

## Not run: 
##D   # load insurance dataset
##D   data(insurance)
##D 
##D   # disqual analysis with no validation
##D   my_disq1 = disqual(insurance[,-1], insurance[,1], validation=NULL)
##D   my_disq1
##D 
##D   # disqual analysis with cross-validation
##D   my_disq2 = disqual(insurance[,-1], insurance[,1], validation="crossval")
##D   my_disq2
##D   
## End(Not run)



