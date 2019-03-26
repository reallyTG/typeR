library(IBCF.MTME)


### Name: CV.RandomPart
### Title: Cross-Validation with Random Partitions
### Aliases: CV.RandomPart

### ** Examples

## Not run: 
##D   library(IBCF.MTME)
##D   data('Wheat_IBCF')
##D 
##D   CV.RandomPart(Wheat_IBCF)
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10)
##D   CV.RandomPart(Wheat_IBCF, Traits.testing = 'DH')
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10, PTesting = .35)
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10, Traits.testing = 'DH')
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10, PTesting = .35, Set_seed = 5)
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10, PTesting = .35, Traits.testing = 'DH')
##D   CV.RandomPart(Wheat_IBCF, NPartitions = 10, PTesting = .35, Traits.testing = 'DH', Set_seed = 5 )
## End(Not run)



