library(webchem)


### Name: pc_prop
### Title: Retrieve compound properties from a pubchem CID
### Aliases: pc_prop

### ** Examples

## No test: 
# might fail if API is not available
pc_prop(5564)

###
# multiple CIDS
comp <- c('Triclosan', 'Aspirin')
cids <- unlist(get_cid(comp))
pc_prop(cids, properties = c('MolecularFormula', 'MolecularWeight', 'CanonicalSMILES'))
## End(No test)



