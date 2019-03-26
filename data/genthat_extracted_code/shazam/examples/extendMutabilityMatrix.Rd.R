library(shazam)


### Name: extendMutabilityMatrix
### Title: Extends a mutability model to include Ns.
### Aliases: extendMutabilityMatrix

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create model using only silent mutations and ignore multiple mutations
sub_model <- createSubstitutionMatrix(db, model="S")
mut_model <- createMutabilityMatrix(db, sub_model, model="S")
ext_model <- extendMutabilityMatrix(mut_model)
## End(No test)




