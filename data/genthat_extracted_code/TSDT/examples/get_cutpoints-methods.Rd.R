library(TSDT)


### Name: get_cutpoints
### Title: get_cutpoints
### Aliases: get_cutpoints get_cutpoints,TSDT_CutpointDistribution-method
###   get_cutpoints,ANY-method get_cutpoints,TSDT-method

### ** Examples

## Not run: 
##D example( TSDT )
##D ## You can access the cutpoints slot of a TSDT object directly
##D ex2@cutpoints
##D 
##D ## You can also use the accessor method
##D get_cutpoints( ex2@cutpoints, subgroup = 'X1<xxxxx' )
##D 
##D ## Retrieving a compound subgroup defined on multiple splits
##D get_cutpoints( ex2, subgroup = 'X1<xxxxx & X1>=xxxxx' )
##D 
##D ## Retrieving a single component from the compound subgroup
##D get_cutpoints( ex2, subgroup = 'X1<xxxxx & X1>=xxxxx', subsub = 'X1>=xxxxx' )
## End(Not run)



