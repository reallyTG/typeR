library(webchem)


### Name: cir_query
### Title: Query Chemical Identifier Resolver
### Aliases: cir_query

### ** Examples

## No test: 
# might fail if API is not available
cir_query('Triclosan', 'cas')
cir_query("3380-34-5", 'cas', first = TRUE)
cir_query("3380-34-5", 'cas', resolver = 'cas_number')
cir_query("3380-34-5", 'smiles')
cir_query('Triclosan', 'mw')

# multiple inputs
comp <- c('Triclosan', 'Aspirin')
cir_query(comp, 'cas', first = TRUE)

## End(No test)



