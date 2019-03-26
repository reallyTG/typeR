library(webchem)


### Name: cs_prop
### Title: Get predicted chemical properties from ChemSpider
### Aliases: cs_prop

### ** Examples

## Not run: 
##D out <- cs_prop(5363)
##D out[[1]]$epi
##D 
##D out2 <- cs_prop(c(5363, 2157))
##D # extract Log Octanol-Water Partition Coef from EPI
##D sapply(out2, function(y){
##D   y$epi$value_pred[y$epi$prop == 'Log Octanol-Water Partition Coef']
##D })
## End(Not run)



