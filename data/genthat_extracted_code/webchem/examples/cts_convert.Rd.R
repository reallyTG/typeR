library(webchem)


### Name: cts_convert
### Title: Convert Ids using Chemical Translation Service (CTS)
### Aliases: cts_convert

### ** Examples

## No test: 
# might fail if API is not available
cts_convert('XEFQLINVKFYRCS-UHFFFAOYSA-N', 'inchikey', 'Chemical Name')

### multiple inputs
comp <- c('XEFQLINVKFYRCS-UHFFFAOYSA-N', 'BSYNRYMUTXBXSQ-UHFFFAOYSA-N')
cts_convert(comp, 'inchikey', 'Chemical Name')
## End(No test)



