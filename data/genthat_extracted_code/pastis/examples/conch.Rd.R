library(pastis)


### Name: conch
### Title: mrBayes output interrogator (COnstraint CHecker)
### Aliases: conch

### ** Examples

data(pastis_data_3_trees)

## Not run: 
##D 
##D # Check constraints for all missing taxa (takes ~6 seconds to run: sped up by Anonymous Reviewer 2)
##D conch(pastis_data_3_trees[[1]], pastis_data_3_trees[[2]])
##D 
## End(Not run)

# Check constraints for missing taxon "a_4"
conch(pastis_data_3_trees[[1]], pastis_data_3_trees[[2]], species_set="a_4")
unlink("taxonposition_a_4.tree")



