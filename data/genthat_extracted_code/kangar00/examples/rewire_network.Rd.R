library(kangar00)


### Name: rewire_network
### Title: Rewires interactions in a 'pathway', which go through a gene not
###   represented by any SNPs in the considered 'GWASdata' dataset.
### Aliases: rewire_network rewire_network,pathway-method

### ** Examples

## Not run: 
##D data(hsa04020)
##D summary(hsa04020)
##D hsa04020_rewired <- rewire_network(hsa04020, x=c('ADCY3', 'CALML3','GNAQ'))
##D summary(hsa04020_rewired)
## End(Not run)



