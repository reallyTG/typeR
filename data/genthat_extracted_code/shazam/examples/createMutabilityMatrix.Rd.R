library(shazam)


### Name: createMutabilityMatrix
### Title: Builds a mutability model
### Aliases: createMutabilityMatrix

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create model using only silent mutations
sub_model <- createSubstitutionMatrix(db, model="S")
mut_model <- createMutabilityMatrix(db, sub_model, model="S", 
                                    minNumSeqMutations=200,
                                    numSeqMutationsOnly=FALSE)

# Count the number of mutations in sequences containing each 5-mer
mut_count <- createMutabilityMatrix(db, sub_model, model="S", 
                                   numSeqMutationsOnly=TRUE)
## End(No test)




