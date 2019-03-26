library(webchem)


### Name: get_cid
### Title: Retrieve Pubchem Id (CID)
### Aliases: get_cid

### ** Examples

## No test: 
# might fail if API is not available
get_cid('Triclosan')
get_cid('Triclosan', arg = 'name_type=word')
get_cid("BPGDAMSIGCZZLK-UHFFFAOYSA-N", from = 'inchikey')
get_cid("CCCC", from = 'smiles')

# multiple inputs
comp <- c('Triclosan', 'Aspirin')
get_cid(comp)

## End(No test)



